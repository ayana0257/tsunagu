class Blog < ApplicationRecord

	belongs_to :user, optional: true
	attachment :image
end
