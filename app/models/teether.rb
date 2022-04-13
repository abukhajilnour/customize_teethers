class Teether < ApplicationRecord
  has_many :order_items
  
  has_many :colors
  has_many :typations, dependent: :destroy
  has_many :types, through: :typations
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search_by(search_term)
    where("LOWER(keywords) LIKE :search_term",
     search_term: "%#{search_term.downcase}%")
  end

    def to_builder
    Jbuilder.new do |teether|
      teether.price stripe_price_id
      teether.quantity 1
    end
  end

    after_create do
      teether = Stripe::Product.create(name: name)
      price = Stripe::Price.create(product: teether, unit_amount: self.price.to_i, currency:"cad")
      update(stripe_teether_id: teether.id, stripe_price_id: price.id)
    end
      after_update :create_and_assign_new_stripe_price, if: :saved_change_to_price?
  def create_and_assign_new_stripe_price
    price = Stripe::Price.create(product: self.stripe_teether_id, unit_amount: self.price, currency: "cad")
    update(stripe_price_id: price.id)
  end
  
end
