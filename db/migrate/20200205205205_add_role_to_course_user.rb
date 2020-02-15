class AddRoleToCourseUser < ActiveRecord::Migration[6.0]
  def change
    add_column :course_users, :role, :string
  end
end
