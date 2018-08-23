class Decision < ApplicationRecord
	#
	#/\A\[[+-]?\d,+\]+\z/
	validates :description, presence: true #, format: { with: /\A+\[[0-9,\s]+\]+\z/, message: "Integer only. No sign allowed." }
	validates :origin, presence: true
end
