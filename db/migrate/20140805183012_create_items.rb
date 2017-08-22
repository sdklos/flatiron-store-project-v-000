class CreateItems < ActiveRecord::Migration
  def change
    create_table (:items) do |t|
      t.integer :inventory
      t.decimal :price
    end

  end
end
