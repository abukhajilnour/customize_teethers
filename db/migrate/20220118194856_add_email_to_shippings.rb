class AddEmailToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :email, :text
  end
end
