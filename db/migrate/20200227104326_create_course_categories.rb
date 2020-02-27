class CreateCourseCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :course_categories do |t|
      t.belongs_to :course
      t.belongs_to :category

      t.timestamps
    end
  end
end
