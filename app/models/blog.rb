class Blog < ApplicationRecord

	belongs_to :user, optional: true
	has_many :blog_images, dependent: :destroy
	accepts_attachments_for :blog_images, attachment: :image
	# attachment :image
end
