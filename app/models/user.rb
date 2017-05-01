class User < ApplicationRecord
	has_secure_password

	# has_many :shifts
	# has_many :expenses, through: :shifts
	# has_many :expenses


  	has_many :shifts, foreign_key: 'user_id', primary_key: "id", dependent: :destroy
  	has_many :expenses, :through => :shifts
  	accepts_nested_attributes_for :shifts, :expenses
end
