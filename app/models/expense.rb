class Expense < ApplicationRecord
	# belongs_to :shifts
	# belongs_to :user, through: :shifts
	belongs_to :user

	@@EXPENSE_TYPES = [['Gas', 'Gas'], ['Food', 'Food'], ['Maintenance', 'Maintenance'], ['Car Payment','Car Payment'], ['License, Title and Registration', 'License, Title and Registration'], ['Car Wash', 'Car Wash'], ['Parking Fees', 'Parking Fees'], ['Tolls', 'Tolls'], ['Phone Bill', 'Phone Bill'], ['Other', 'Other']]

	def self.expense_types
		@@EXPENSE_TYPES
	end

	def start_time
		self.date
	end
end
