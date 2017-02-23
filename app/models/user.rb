class User < ApplicationRecord
	has_secure_password

	has_many :shifts
	# has_many :expenses, through: :shifts
	has_many :expenses
end
