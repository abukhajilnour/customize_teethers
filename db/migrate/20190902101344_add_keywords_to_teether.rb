class AddKeywordsToTeether < ActiveRecord::Migration[5.2]
  def change
    add_column :teethers, :keywords, :text
  end
end
