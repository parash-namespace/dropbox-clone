class Folder < ApplicationRecord

	acts_as_tree

	validates :name, presence: true, uniqueness: {case_sensitive: false}
	
	has_many_attached :uploads

end