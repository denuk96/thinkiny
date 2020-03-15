class DropActiveStorage < ActiveRecord::Migration[6.0]
  def change
    remove_column :lessons, :picture
    add_column :lessons, :picture, :string
    remove_column :users, :picture
    add_column :users, :picture, :string
    add_column :courses, :logo, :string
    remove_column :courses, :pictures, :string, array: true, default: []
    add_column :courses, :pictures, :string, array: true, default: []
  end
end
