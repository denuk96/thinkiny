class CoursesController < ApplicationController
  include CoursesRights
  include CheckInsChecker
  before_action :set_course, only: %i[show edit update destroy change_role set_user_confirmation change_course_status]
  before_action :check_course_status, except: %i[index show new create]
  before_action :verify_organizer, only: %i[destroy]
  before_action :verify_moderators, only: %i[edit update change_role set_user_confirmation change_course_status]

  def index
    @courses = Course.all.order(created_at: :desc)
  end

  def show
    @lessons = @course.lessons.order('time ASC')
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      @course.course_users.create(user_id: current_user.id, role: 'organizer')
      redirect_to course_path(@course), notice: 'Course has been created'
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
      @course.update(status: 'in_process', pre_moderation: true)
    when 'in_process'
      @course.update(status: 'completed', pre_moderation: true)
    else
      flash[:alert] = 'Course is already completed'
    end
    flash[:notice] = "Status has changed to #{@course.status}"
    redirect_to course_path(@course)
  end

  private

  def set_course
    @course = Course.find(params[:id])
    @course_user = @course.course_users.find_by(id: params[:course_user_id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :status, :pre_moderation, :place_quantities,
                                   :address, :latitude, :longitude, pictures: [])
  end
end
