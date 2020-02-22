class ChangeCourse < ActiveRecord::Migration[6.0]
  def change
    change_column :courses, :status, :string, default: 'new'
  end
end
