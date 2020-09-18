class SharesController < ApplicationController

	layout 'dropbox'

	def index
		@folders = current_user.shared_folders
	end

end