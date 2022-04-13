class AddOrderToShippings < ActiveRecord::Migration[5.2]
  def change
    add_reference :shippings, :order, foreign_key: true
  end
end
