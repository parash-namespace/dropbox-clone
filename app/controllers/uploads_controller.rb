class UploadsController < ApplicationController


	layout 'dropbox'

	
	before_action :get_folder, :get_root_folder, :get_folders, :has_permission?
	before_action :is_owner?, except: [:index]

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

	def uploads_params
		params.require(:upload).permit(uploads: [])
	end
	
	def get_folder
		@folder = Folder.find(params[:folder_id])
	end

	def get_root_folder
		@root_folder = @folder
	end

	def get_folders
		@folders = @root_folder.children
	end

	def has_permission?
		redirect_to root_path if (!is_shared? && (@root_folder.owner_id != current_user.id))
	end

	def is_owner?
		redirect_to root_path if @folder.owner_id != current_user.id
	end

	def is_shared?

		flag = false
		folder = @root_folder
		
		while folder.parent.present?
			result = current_user.shares.find_by('folder_id': folder.id)

			if result
				flag = true
				break
			end
			folder = folder.parent
		end

		flag
	end

end