class FoldersController < ApplicationController

	layout 'dropbox'

	before_action :get_folder, only: [:show, :update, :destroy]

	def index
		@folder = Folder.new
		@folders = Folder.where.not('name': 'root')
	end

	def new
		@folder = Folder.new
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

	def update
		@folder.update(folder_params)
	end

	def destroy
		if @folder.present?
			@folder.destroy
		end
		@folders = Folder.where.not('name': 'root')
	end

	private
	def folder_params
		params.require(:folder).permit(:name, :folder_description)
	end

	def get_folder
		@folder = Folder.find(params[:id])
	end
end