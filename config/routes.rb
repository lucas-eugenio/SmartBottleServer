# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    resources :water_consumes, only: %i[create]
  end
  resources :home, only: %i[index]
  resources :weekly_consume, only: %i[index]
end
