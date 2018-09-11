class Party < ApplicationRecord
	has_many :favorites
	has_many :users, through: :favorites
	has_many :attendparties
	has_many :users, through: :attendparties
end
