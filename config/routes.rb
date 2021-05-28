# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/url_shortener/:url/(:slug)/(:expires_on)', to: 'url_shortener#create'
      get '/s/:slug', to: 'url_shortener#show', as: :short
    end
  end
end
