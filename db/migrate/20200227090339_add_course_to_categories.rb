class AddCourseToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :category
  end
end
