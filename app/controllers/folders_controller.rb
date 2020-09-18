class FoldersController < ApplicationController

	layout 'dropbox'

	before_action :get_folder, only: [:show, :update, :destroy]
	before_action :get_root_folder, only: [:index, :create, :destroy]
	before_action :get_folders, only: [:index]

	def index
	end

	def new
		@folder = Folder.new
		@parent_id = params[:parent_id] if params[:parent_id]
	end

	def create
		@folder = Folder.new(folder_params)
		@folder.owner_id = current_user.id

		@folder.parent_id = get_parent_param['parent_id']
		@folder.parent_id = @root_folder.id if @folder.parent_id.nil?
		
		@folder.save
	end

	def show
	end

	def update
		@folder.update(folder_params)
		get_folder
	end

	def destroy
		if @folder.present?
			@folder.destroy
		end
	end

	# might be used in other classes as well
	private
	def get_root_folder
		@root_folder = current_user.folders.first_or_create("name": "root")
	end

	def folder_params
		params.require(:folder).permit(:name, :folder_description)
	end

	def get_parent_param
		params.require(:folder).permit(:parent_id)
	end

	def get_folder
		@folder = Folder.find(params[:id])
	end

	def get_folders
		@folders = @root_folder.children
	end

end