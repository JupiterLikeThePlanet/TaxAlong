class Expense < ApplicationRecord
	belongs_to :shifts
	# belongs_to :user, through: :shifts
	belongs_to :user
end
