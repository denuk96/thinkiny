class PicturesController < ApplicationController
  before_action :set_course

  def create
    add_more_pictures(pictures_params[:pictures])
    flash[:error] = 'Failed uploading images' unless @course.save
    redirect_to :back
  end

  def destroy
    remove_picture_at_index(params[:id].to_i)
    flash[:error] = 'Failed deleting picture' unless @course.save
    render layout: false
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def add_more_pictures(new_pictures)
    pictures = @course.pictures
    pictures += new_pictures
    @course.pictures = pictures
  end

  def remove_picture_at_index(index)
    remain_pictures = @course.pictures
    deleted_picture = remain_pictures.delete_at(index)
    deleted_picture.try(:remove!)
    @course.pictures = remain_pictures
  end

  def pictures_params
    params.require(:course).permit(pictures: [])
  end
end
