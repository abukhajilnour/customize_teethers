class CreateImageToTeether < ActiveRecord::Migration[5.2]
  def self.up
    add_attachment :teethers, :image
  end

  def self.down
    remove_attachment :teethers, :image
  end
end
