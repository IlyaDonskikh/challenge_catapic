Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}

  authenticated :user do
    root to: "cats#index", as: 'cats'
  end

  devise_scope :user do
    root to: "devise/sessions#new"

    resources :invites, only: [:new, :create]
  end
end
