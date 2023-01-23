Rails.application.routes.draw do
  
  root "messages#index"

  resources :messages, only: [:index, :show, :new, :create]
  get "/tags/:name/messages", to: "messages#index_by_tag"

end
