class AddStripePriceIdToTeethers < ActiveRecord::Migration[5.2]
  def change
    add_column :teethers, :stripe_price_id, :string
  end
end
