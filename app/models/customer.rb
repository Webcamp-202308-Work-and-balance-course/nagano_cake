class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :cart_items
         has_many :orders
  
  enum status: { false: 0, true: 1 }       
  def active_for_authentication?
    super && (is_active == true)
  end         
end
