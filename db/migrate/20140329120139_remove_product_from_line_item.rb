class RemoveProductFromLineItem < ActiveRecord::Migration
  def up
  	remove_column :line_items, :product
  end
  
  def down
  	add_column :line_items, :product, :string
  end
end
