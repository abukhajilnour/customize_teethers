class AddStateToShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings, :state, :text
  end
end
