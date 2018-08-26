class Decision < ApplicationRecord
	#
	#/\A\[[+-]?\d,+\]+\z/
	belongs_to :greenhouse
	# validates :description, presence: true #, format: { with: /\A+\[[0-9,\s]+\]+\z/, message: "Integer only. No sign allowed." }
	# validates :origin, presence: true
	# NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"] #or any other attribute that does not need validation
 #  VALIDATABLE_ATTRS = Decision.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}
 #  validates_presence_of VALIDATABLE_ATTRS
end
