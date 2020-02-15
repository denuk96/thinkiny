class RenameColumnInCheckIns < ActiveRecord::Migration[6.0]
  def change
    rename_column :check_ins, :present, :attendance
  end
end
