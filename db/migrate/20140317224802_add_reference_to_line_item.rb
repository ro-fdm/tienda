class AddReferenceToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :producto, index: true
    add_reference :line_items, :pedido, index: true
  end
end
