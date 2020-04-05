class RenemePlaceholder < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :place_quantities
    add_column :courses, :place_quantities, :integer
  end
end
