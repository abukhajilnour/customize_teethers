class AddDiscountToTeether < ActiveRecord::Migration[5.2]
  def change
    add_column :teethers, :discount, :text
    add_column :teethers, :kind, :text
  end
end
