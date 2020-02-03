class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
