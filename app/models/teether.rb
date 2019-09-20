class Teether < ApplicationRecord
  has_many :colors
  has_many :typations, dependent: :destroy
  has_many :types, through: :typations
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search_by(search_term)
    where("LOWER(keywords) LIKE :search_term",
     search_term: "%#{search_term.downcase}%")
  end
end
