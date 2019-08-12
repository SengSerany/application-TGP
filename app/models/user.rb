class User < ApplicationRecord
after_create :welcome_send

	has_secure_password
	belongs_to :city
	has_many :comments
	has_many :gossips
	validates :password,
		presence: true

	def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
