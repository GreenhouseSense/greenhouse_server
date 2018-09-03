class Greenhouse < ApplicationRecord
	belongs_to :user, dependent: :destroy
	belongs_to :greenhouse_service
	has_many :decisions
	has_many :readings
end
