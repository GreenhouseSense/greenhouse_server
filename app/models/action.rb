class Action < ApplicationRecord
	validates :description, presence: true
	 validates_uniqueness_of :description
end
