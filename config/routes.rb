# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :hunters, defaults: { format: :json }, singular: :hunter, path: 'hunters',
                           path_names: {
                             sign_in: 'login',
                             sign_out: 'logout',
                             registration: 'signup'
                           },
                           controllers: {
                             sessions: 'api/v1/hunters/sessions',
                             registrations: 'api/v1/hunters/registrations'
                           }

      devise_for :admins, defaults: { format: :json }, singular: :admin, path: 'admins',
                          path_names: {
                            sign_in: 'login',
                            sign_out: 'logout'
                          },
                          controllers: {
                            sessions: 'api/v1/admins/sessions'
                          }

      namespace :hunters do
        namespace :easter_eggs do
          resources :revealed, only: %i[index]
          resources :unrevealed, only: %i[index]
          resources :reveal, only: %i[create]
        end
      end

      namespace :admins do
        resources :easter_eggs, only: %i[create update index]
      end
    end
  end
end
