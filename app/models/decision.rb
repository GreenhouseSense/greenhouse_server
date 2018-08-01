class Decision < ApplicationRecord
	validates :description, presence: true 
	validates :origin, presence: true
end
