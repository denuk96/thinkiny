class CoursesController < ApplicationController
  include CoursesRights
  include CheckInsChecker
  before_action :set_course, only: %i[show edit update destroy change_role set_user_confirmation change_course_status]
  before_action :check_course_status, except: %i[index show new create nearbys]
  before_action :verify_organizer, only: %i[destroy]
  before_action :verify_moderators, only: %i[edit update change_role set_user_confirmation change_course_status]
  before_action :check_on_nil_params, only: :update

  def index
    @categories = Category.all
    @courses = case params[:sort]
               when 'oldest'
                 Course.includes([:categories]).all.newest
               when 'popular'
                 Course.includes([:categories]).all.popular
               when 'unpopular'
                 Course.includes([:categories]).all.unpopular
               when 'fresh'
                 Course.includes([:categories]).all.fresh
               when 'in_process'
                 Course.includes([:categories]).all.in_process
               when 'completed'
                 Course.includes([:categories]).all.completed
               when 'rated'
                 Course.includes([:categories]).all.rated
               else
                 if params.dig(:q, :category_id)
                   @category = Category.find(params.dig(:q, :category_id))
                   courses = Course.all
                   @search = @category.courses.search(params[:q])
                   @courses = @search.result
                 else
                   @search = Course.search(params[:q])
                   @courses = @search.result
                 end
               end
  end

  def show
    @lesson = @course.lessons.first if @course.lessons.exists?
    @lessons = @course.lessons.order('time ASC')
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      @course.course_users.create(user_id: current_user.id, role: 'organizer')
      redirect_to course_path(@course, lesson_id: @course&.lessons&.first&.id), notice: 'Course has been created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course has been edited'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: 'Course has been successfully destroyed'
  end

  def change_role
    @lessons = @course.lessons
    if @course_user.role == 'participant'
      @course_user.update(role: 'instructor', confirmed: true)
      check_ins_destroy(@lessons, @course_user)
      redirect_to course_path(@course)
    else
      @course_user.update(role: 'participant', confirmed: true)
      check_ins_create(@lessons, @course_user)
      redirect_to course_path(@course)
    end
  end

  def nearbys
    @courses = Course.all
    location_info = request.location
    @courses_near = Course.near([location_info.latitude, location_info.longitude], 10)
    @a = []
    @courses.each do |course|
      @a.push(["<a href='#{course_url(course)}'>#{course.name}</a>", (course.logo.present? ? "<img src='#{course&.logo.url}' alt='#{course.name}' height='42' width='42'>" : "<img src='#{'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1200px-Google_Chrome_icon_%28September_2014%29.svg.png'}' alt='#{course.name}' height='42' width='42'>"), course.latitude, course.longitude])
    end
  end

  def set_user_confirmation
    if @course_user.confirmed == false
      @course_user.confirmed = true
      check_ins_create(@course.lessons, @course_user)
    else
      @course_user.confirmed = false
      check_ins_destroy(@course.lessons, @course_user)
    end
    @course_user.save
    redirect_to course_path(@course)
  end

  def change_course_status
    case @course.status
    when 'new'
      @course.update(status: 'in_process')
    when 'in_process'
      @course.update(status: 'completed', pre_moderation: true)
      ### check attendance for completing course ###
      @course.course_users.confirmed_participant.each do |course_user|
        lessons_count = @course.lessons.size
        @user_attendance = 0
        @course.lessons.each do |lesson|
          @user_attendance += 1 if lesson.check_ins.find_by(user_id: course_user.user_id, attendance: true).present?
        end
        user_attendance_rate = @user_attendance.to_f / lessons_count * 100
        course_user.update(completed: true) if @course.attendance_rate <= user_attendance_rate
      end
    else
      flash[:alert] = 'Course is already completed'
    end
    flash[:notice] = "Status has changed to #{@course.status&.humanize}"
    @course.users.each { |user| Notification.create(user_id: user.id, notification: "Course #{@course.name} has been changed status to #{@course.status}") }
    redirect_to course_path(@course)
  end

  private

  def set_course
    @course = Course.find(params[:id])
    @course_user = @course.course_users.find_by(id: params[:course_user_id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :attendance_rate, :pre_moderation, :place_quantities,
                                   :address, :latitude, :longitude, :logo, pictures: [], category_ids: [])
  end

  def check_on_nil_params
    redirect_to @course if params[:course].nil?
  end
end
