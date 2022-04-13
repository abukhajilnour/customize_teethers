class AddAddress2ToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :address2, :text
  end
end
