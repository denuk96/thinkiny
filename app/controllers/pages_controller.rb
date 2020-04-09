class PagesController < ApplicationController
  def welcome
    @courses = Course.all
    location_info = request.location
    @courses_near = Course.near([location_info.latitude, location_info.longitude], 6.21371)
    @locations = []
    @courses_near.each do |course|
      @locations.push(["<a href='#{course_url(course)}'>#{course.name}</a>", (course.logo.present? ? "<img src='#{course&.logo.url}' alt='#{course.name}' height='42' width='42'>" : "<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1200px-Google_Chrome_icon_%28September_2014%29.svg.png' alt='#{course.name}' height='42' width='42'>"), course.latitude, course.longitude])
    end
  end

  def show
    render template: "pages/#{params[:page]}"
  end
  
end
