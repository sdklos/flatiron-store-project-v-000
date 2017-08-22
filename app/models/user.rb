class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts, class_name: 'Cart'

  def current_cart=(cart_id)
    @current_cart = self.carts.find_by(id: cart_id)
  end

  def current_cart
    @current_cart
  end

end
