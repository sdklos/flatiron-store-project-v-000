class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category

  def self.available_items
    Item.all.select { |item| item.inventory > 0 }
  end


end
