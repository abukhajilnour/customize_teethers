class AddTeetherIsToColors < ActiveRecord::Migration[5.2]
  def change
    add_column :colors, :teether_id, :integer
  end
end
