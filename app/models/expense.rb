class Expense < ApplicationRecord
	belongs_to :shift
	belongs_to :user, through: :shifts
end
