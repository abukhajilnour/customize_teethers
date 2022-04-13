class AddStripeTeetherIdToTeethers < ActiveRecord::Migration[5.2]
  def change
    add_column :teethers, :stripe_teether_id, :string
  end
end
