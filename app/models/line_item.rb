class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  validates :item_id, presence: true
  validates :cart_id, presence: true
end
