class AddTeetherIdToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :teether, foreign_key: true
  end
end
