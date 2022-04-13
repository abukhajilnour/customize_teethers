class AddCityToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :city, :text
  end
end
