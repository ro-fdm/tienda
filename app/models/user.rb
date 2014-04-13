class User < ActiveRecord::Base
	has_secure_password
	validates :name, :email, presence: true
	validates :email, uniqueness: true
	validates :email, format { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on :create}
	validates :password, confirmation: true
	validates :password, length: {minimum :8}, on: :create
  validates :password_confirmation, presence: true
 # validates :password,  format: {with: \A[a-zA-Z]+\z
  
end
