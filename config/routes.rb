Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "cats#index", as: 'cats'
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
