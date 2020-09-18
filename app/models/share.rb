class Share < ApplicationRecord

	self.table_name = "shares"

	validates :user_id, uniqueness: {scope: :folder_id}

	belongs_to :user
	belongs_to :folder

end