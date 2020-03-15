class DropActiveStorage < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :picture, :string
    add_column :users, :picture, :string
    add_column :courses, :logo, :string
    add_column :courses, :pictures, :string, array: true, default: []
  end
end
