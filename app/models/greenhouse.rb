class Greenhouse < ApplicationRecord
	belongs_to :user, dependent: :destroy
	has_many :decisions
	has_many :readings
end
