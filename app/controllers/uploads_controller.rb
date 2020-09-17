class UploadsController < ApplicationController


	layout 'dropbox'

	
	before_action :get_folder

	def index
	end

	def new
		@uploads = @folder.uploads
	end

	def create
		@folder.update(uploads_params)
	end


	private
	
	def get_folder
		@folder = Folder.find(params[:folder_id])
	end

	def uploads_params
		params.require(:upload).permit(uploads: [])
	end

end