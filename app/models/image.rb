class Image < ApplicationRecord
	belongs_to :course
	has_many :images
end
