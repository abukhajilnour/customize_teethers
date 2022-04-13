class AddLastNameToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :last_name, :text
  end
end
