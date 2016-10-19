class User < ApplicationRecord
	has_many :shifts
	has_many :expenses, through: :shifts
end
