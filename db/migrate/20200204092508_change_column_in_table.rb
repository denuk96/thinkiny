class ChangeColumnInTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :second_name, :string
    add_column :users, :last_name, :string
  end
end
