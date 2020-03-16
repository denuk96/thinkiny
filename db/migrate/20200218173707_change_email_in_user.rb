class ChangeEmailInUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :email, :string, null: false
    add_column :users, :email, :string, null: true
  end
end
