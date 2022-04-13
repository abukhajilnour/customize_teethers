class Type < ApplicationRecord
  has_many :typations,dependent: :destroy
  has_many :teethers, through: :typations
end
