Samay::Application.routes.draw do

  unauthenticated do
    root to: 'home#index', as: :public_root
    get '/about', to: 'home#about'
    get '/policies', to: 'home#policies'
    get '/projects', to: 'home#projects'
  end

  authenticated :user do
    root to: 'dashboard#index', as: :application_root
  end

  devise_for :users, skip: [:registrations]
  as :user do
    get 'my/profile/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    patch 'my/profile' => 'devise/registrations#update', as: 'user_registration'
  end

  resources :users do
    get :copy
    patch :lock, :unlock, :archive, :unarchive
  end

  resources :divisions do
    get :copy
    patch :lock, :unlock, :archive, :unarchive
  end

  resources :clients do
    get :copy
    patch :lock, :unlock, :archive, :unarchive
  end

  resources :projects do
    get :copy
    patch :lock, :unlock, :archive, :unarchive
    collection do
      match 'select', to: 'projects#select', via: [:get]
    end
  end

  resources :departments do
    get :copy
    patch :lock, :unlock, :archive, :unarchive
  end

  resources :employees do
    get :copy
    get 'photo(/:version)', to: 'employees#photo'
    patch :lock, :unlock, :archive, :unarchive
    collection do
      match 'select', to: 'employees#select', via: [:get]
    end
  end

  resources :timesheets do
    patch :cancel, :close
  end

  resources :pipelines do
    patch :cancel, :close
  end

  match 'search', to: 'search#results', via: [:get]

  resources :reports, only: [:index, :show]

end
