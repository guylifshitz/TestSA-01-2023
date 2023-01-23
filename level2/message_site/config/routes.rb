Rails.application.routes.draw do
  
  root "messages#index"

  resources :messages, only: [:index, :show, :new, :create]
  get "/tags/:name/messages", to: "messages#index_by_tag"

  get "/api/messages.json", to: "messages#index", :as => :api_messages
  get "/api/tags/:name/messages.json", to: "messages#index_by_tag", :as => :api_messages_by_tag
  get "/api/messages/:id.json", to: "messages#show", :as => :api_message

end
