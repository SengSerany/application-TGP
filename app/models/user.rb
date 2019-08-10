class User < ApplicationRecord
	attr_accessor :password, :password_confirmation
	before_create :password_digest
	belongs_to :city
	has_many :gossips
	validates :password,
		presence: true
end
