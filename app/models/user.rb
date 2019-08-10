class User < ApplicationRecord
	has_secure_password
	belongs_to :city
	has_many :gossips
	validates :password,
		presence: true
end
