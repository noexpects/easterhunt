# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: redirect('/api-docs')

  namespace :admin_panel do
    resources :easter_eggs, only: %i[index show new create edit update]
    resources :hunters, only: %i[index show]

    root to: 'easter_eggs#index'
  end

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

      devise_for :admins, defaults: { format: :json }, singular: :admin, path: 'admins',
                          skip: %i[registrations invitations passwords confirmations unlocks],
                          path_names: {
                            sign_in: 'login',
                            sign_out: 'logout'
                          },
                          controllers: {
                            sessions: 'api/v1/admins/sessions'
                          }

      namespace :admins do
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
