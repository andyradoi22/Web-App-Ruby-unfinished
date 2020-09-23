Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web =>"/sidekiq"

  get 'home/index'
  root 'home#indeex'
  namespace 'api' do
    namespace 'data' do
      resources :boards do
        resources :columns do
          resources :stories
        end
      end
    end
    namespace 'auth' do
      post :getjwt, to: "authentication#create"
    end
    namespace 'link' do
      resources :enteries, only: [:update, :destroy]
      resources :tasks, only: [:update, :destroy]
    end
  end
end