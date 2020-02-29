class AddattendancerateTocourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :attendance_rate, :integer, default: 50
    add_column :course_users, :completed, :boolean, default: false
  end
end
