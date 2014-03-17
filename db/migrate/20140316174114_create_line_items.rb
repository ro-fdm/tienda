class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :producto
      t.integer :cantidad
      t.decimal :precio
			
      t.timestamps
    end
  end
end
