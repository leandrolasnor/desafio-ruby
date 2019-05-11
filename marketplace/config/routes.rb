Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  authenticated :user do
    root 'rails_admin/main#dashboard', as: :authenticated_root
  end

  root "home#index"
end
