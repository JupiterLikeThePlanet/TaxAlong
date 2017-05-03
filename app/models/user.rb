class User < ApplicationRecord
	has_secure_password

	has_many :shifts
	# has_many :expenses, through: :shifts
	has_many :expenses

	accepts_nested_attributes_for :shifts, :expenses, :allow_destroy => true
end
