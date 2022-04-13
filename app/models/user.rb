class User < ApplicationRecord
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    admin
  end

  def to_s
    email
  end


  after_create do
    customer = Stripe::Customer.create(email: email)
    update(stripe_customer_id: customer.id)
    
  end
  
end
