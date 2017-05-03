class Expense < ApplicationRecord
	# belongs_to :shifts
	# belongs_to :user, through: :shifts
	belongs_to :user

	@@EXPENSE_TYPES = ['Gas', 'Food', 'Maintenance', 'Car Payment', 'License, Title and Registration', 'Car Wash', 'Parking Fees', 'Tolls', 'Phone Bill', 'Other']

	def self.expense_types
		@@EXPENSE_TYPES
	end

	def start_time
		self.date
	end
end
