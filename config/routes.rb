Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/shelters', to: 'shelters#index'
  post '/shelters', to: 'shelters#create'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:shelter_id', to: 'shelters#show'
  get '/shelters/:shelter_id/edit', to: 'shelters#edit'
  patch '/shelters/:shelter_id', to: 'shelters#update'
  delete '/shelters/:shelter_id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'
  get '/pets/:pet_id', to: 'pets#show'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  get '/pets/:pet_id/edit', to: 'pets#edit'
  patch '/pets/:pet_id', to: 'pets#update'
  delete '/pets/:pet_id', to: 'pets#destroy'

  get '/shelters/:shelter_id/reviews/new', to: 'reviews#new'
  post '/shelters/:shelter_id', to: 'reviews#create'
  get '/shelters/:shelter_id/reviews/:review_id/edit', to: 'reviews#edit'
  put '/shelters/:shelter_id/reviews/:review_id', to: 'reviews#update'

end
