class RenemeAttendenceRate < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :attendance_rate
    add_column :courses, :attendance_rate, :integer
  end
end
