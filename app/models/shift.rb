class Shift < ApplicationRecord

	# has_many :expenses
	belongs_to :user, foreign_key: 'user_id', primary_key: :id
	has_many :expenses
	accepts_nested_attributes_for :expenses #, reject_if: proc { .blank?}

	def start_time
		self.date
	end
end
