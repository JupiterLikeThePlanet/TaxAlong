class Expense < ApplicationRecord
	belongs_to :shifts
	belongs_to :user, through: :shifts
end
