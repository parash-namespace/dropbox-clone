class Folder < ApplicationRecord

	has_one :share
	belongs_to :user, foreign_key: "owner_id", class_name: "User"

	
	acts_as_tree

	validates :name, presence: true, uniqueness: {case_sensitive: false, scope: :owner_id}
	
	has_many_attached :uploads

end