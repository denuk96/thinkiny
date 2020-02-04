class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :theme
      t.text :description
      t.timestamp :time
      t.references :course

      t.timestamps
    end
  end
end
