class AddColumnsToTeethers < ActiveRecord::Migration[5.2]
  def change
    add_column :teethers, :status, :string
    add_column :teethers, :quantity, :string
    add_column :teethers, :gender, :string
  end
end
