Ninetyninecats::Application.routes.draw do
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users
  resources :cats
  resources :cat_rental_requests do
    member do
      put "/approve" => "cat_rental_request#approve!"
      put "/deny" => "cat_rental_request#deny!"
    end
  end



end