Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  root 'folders#index'

  get 'folders/parent/:parent_id/new', to: 'folders#new', as: 'new_folder'

  resources 'folders', except: [:index, :new] do
  	resources 'uploads', only: [:index, :new, :create, :destroy]
  end

  get 'shared', to: 'shares#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
