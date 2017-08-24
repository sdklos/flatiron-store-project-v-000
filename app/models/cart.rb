class Cart < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
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
      line_item = self.line_items.find_by(item_id: item_id)
      line_item.quantity += 1
       line_item.save
       line_item.reload
    else
      self.line_items.build(item_id: item_id)
      self.items << Item.find(item_id)
      self.items.last.save
      # self.line_items.last.save
      # self.line_items.reload
    end
    # self.save
    # self.reload
    self.line_items.last
  end

  def submit_cart
    self.submitted = true
    self.save
    self.reload
  end

  def update_inventory
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
      line_item.item.reload
    end
  end

  def status
    if self.submitted
      'submitted'
    end
  end

  def status=(submitted)
    self.submitted = true
  end



end
