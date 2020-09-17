Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  root 'folders#index'

  resources 'folders' do
  	resources 'uploads'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
