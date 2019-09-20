class AddTeetherIdToTypes < ActiveRecord::Migration[5.2]
  def change
     add_column :types, :teether_id, :integer
  end
end
