class AddMoneyToTeether < ActiveRecord::Migration[5.2]
def change
    add_column :teethers, :money, :decimal
    add_column :teethers, :sale, :decimal
  end
end
