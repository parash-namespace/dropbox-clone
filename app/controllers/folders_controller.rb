class FoldersController < ApplicationController

	layout 'dropbox'

	def index
		@folder = Folder.new
		@folders = Folder.all
	end

	def create
		@folder = Folder.new(folder_params)
		@folder.owner_id = current_user.id

		if @folder.save
			flash[:notice] = "Successfully created new folder."
		else
			flash[:alert] = "Failed to create new folder."
		end
		
		redirect_to root_path
	end

	def show
		
	end


	private
	def folder_params
		params.require(:folder).permit(:name, :folder_description)
	end
end