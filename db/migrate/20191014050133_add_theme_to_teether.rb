class AddThemeToTeether < ActiveRecord::Migration[5.2]
  def change
    add_column :teethers, :theme, :text
  end
end
