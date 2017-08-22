class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.quantity * line_item.item.price
    end
    total
  end

  def line_items_find(item_id)
    self.line_items.detect do |line_item|
      line_item[:item_id] = item_id
    end
  end

  def add_item(item_id)
    if self.line_items.find_by(item_id: item_id)
      line_item = line_items.find_by(item_id: item_id)
      line_item.quantity += 1
    else
      self.line_items.build(item_id: item_id)
    end
  end
end
