class AddCourseFeedbackToCourseUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :course_users, :course_rating, :integer
  end
end
