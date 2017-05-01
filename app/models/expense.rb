class Expense < ApplicationRecord
	# belongs_to :shifts
	# belongs_to :user, through: :shifts

	#working here
	# belongs_to :user

	belongs_to :shift, foreign_key: 'shift_id' , dependent: :destroy

	def start_time
		self.date
	end
end
