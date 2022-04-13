class AddFirstNameToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :first_name, :text
  end
end
