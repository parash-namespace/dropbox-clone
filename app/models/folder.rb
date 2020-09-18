class Folder < ApplicationRecord

	acts_as_tree

	validates :name, presence: true, uniqueness: {case_sensitive: false, scope: :owner_id}
	
	has_many_attached :uploads

end