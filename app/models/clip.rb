class Clip < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :party, optional: true
	validates :user, presence: true
	validates :party, presence: true
	validates :user_id, :uniqueness => {:scope => :party_id}
end
