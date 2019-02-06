# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'site#index'
  namespace :api do
    namespace :v1 do
      resources :mixes
    end
  end
end
