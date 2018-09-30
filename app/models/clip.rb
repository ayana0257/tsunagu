class Clip < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :party, optional: true
	validates :user, presence: true
	validates :party, presence: true
end
