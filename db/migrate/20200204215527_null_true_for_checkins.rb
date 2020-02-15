class NullTrueForCheckins < ActiveRecord::Migration[6.0]
  def change
    change_column :check_ins, :lesson_id, :bigint, null: true
    change_column :check_ins, :user_id, :bigint, null: true
  end
end
