class AddSubmittedToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :submitted, :boolean, default: false
  end
end
