class RemoveNameEmailPasswordToSession < ActiveRecord::Migration
	def up
  	remove_column :sessions, :name
  	remove_column :sessions, :email
  	remove_column :sessions, :password_digest
  end
  
  def down
  	add_column :sessions, :name, :string
  	add_column :sessions, :email, :string
  	add_column :sessions, :password_digest, :string
  end
end
