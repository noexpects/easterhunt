# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin_panel do
    resources :easter_eggs, only: %i[index show new create edit update]
    resources :hunters, only: %i[index show]

    root to: 'easter_eggs#index'
  end

  devise_for :admins, singular: :admin, path: 'admins',
                      skip: %i[registrations invitations passwords confirmations unlocks],
                      path_names: {
                        sign_in: 'login',
                        sign_out: 'logout'
                      },
                      controllers: {
                        sessions: 'admins/sessions'
                      }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :hunters, defaults: { format: :json }, singular: :hunter, path: 'hunters',
                           skip: %i[invitations passwords confirmations unlocks],
                           path_names: {
                             sign_in: 'login',
                             sign_out: 'logout',
                             registration: 'signup'
                           },
                           controllers: {
                             sessions: 'api/v1/hunters/sessions',
                             registrations: 'api/v1/hunters/registrations'
                           }

      namespace :admins do
        devise_scope :admin do
          post 'login', to: 'sessions#create'
          delete 'logout', to: 'sessions#destroy'
        end

        resources :easter_eggs, only: %i[create update index]
      end

      namespace :hunters do
        namespace :easter_eggs do
          resources :revealed, only: %i[index]
          resources :unrevealed, only: %i[index]
          resources :reveal, only: %i[create]
        end
      end
    end
  end
end
