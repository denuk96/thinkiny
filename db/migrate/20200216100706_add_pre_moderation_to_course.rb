class AddPreModerationToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :pre_moderation, :boolean, default: false
    add_column :courses, :place_quantities, :integer, default: 9999
    add_column :course_users, :confirmed, :boolean, default: true
  end
end
