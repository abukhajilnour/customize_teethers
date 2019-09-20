class CreateTypations < ActiveRecord::Migration[5.2]
  def change
    create_table :typations do |t|
      t.references :teether, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
