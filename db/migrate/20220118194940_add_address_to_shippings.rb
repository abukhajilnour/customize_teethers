class AddAddressToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :address, :text
  end
end
