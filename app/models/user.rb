class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts, class_name: 'Cart'
  belongs_to :current_cart, class_name: 'Cart'

  def remove_cart
    if self.current_cart
      self.current_cart = nil
      self.save
      self.reload
    end
  end

  def current_cart
    Cart.find_by(id: self.current_cart_id)
  end

  def create_current_cart(user_id)
    cart = Cart.create(user_id: user_id)
    user = User.find(user_id)
    user.current_cart = cart
    user.save
    user.reload
    cart
  end

end
