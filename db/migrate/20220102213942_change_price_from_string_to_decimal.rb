class ChangePriceFromStringToDecimal < ActiveRecord::Migration[5.2]
  change_column :teethers, :price, 'decimal USING CAST(price AS decimal)'
end
