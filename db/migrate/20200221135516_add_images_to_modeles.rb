class AddImagesToModeles < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :pictures, :string, array: true, default: []
    add_column :users, :picture, :string
    add_column :lessons, :picture, :string

  end
end
