class User < ActiveRecord::Base
	has_secure_password
	validates :name,  presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password, confirmation: true, length: {minimum :8}
  validates :password_confirmation, presence: true
  
end
