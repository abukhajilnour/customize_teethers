class AddZipToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :zip, :integer
  end
end
