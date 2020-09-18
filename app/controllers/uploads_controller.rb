class UploadsController < ApplicationController


	layout 'dropbox'

	
	before_action :get_folder, :get_root_folder, :get_folders, :is_owner?

	def index
		render file: 'folders/index'
	end

	def new
		@uploads = @folder.uploads
	end

	def create
		@folder.update(uploads_params)
	end

	def destroy
		@folder.uploads.delete(params[:id])
	end


	private
	
	def get_folder
		@folder = Folder.find(params[:folder_id])
	end

	def uploads_params
		params.require(:upload).permit(uploads: [])
	end

	def get_root_folder
		@root_folder = @folder
	end

	def get_folders
		@folders = @root_folder.children
	end

	def is_owner?
		redirect_to root_path if @root_folder.owner_id != current_user.id
	end

end