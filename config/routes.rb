Rails.application.routes.draw do

  namespace :register do
    namespace :financeiro do
      resources :providers
    end
  end
  namespace :register do
    namespace :financeiro do
      resources :medication_types
    end
  end
  namespace :register do
    namespace :financeiro do
      resources :food_types
    end
  end
  namespace :files do
    resources :files
  end
  namespace :register do
    resources :animal_types
  end
  root 'dashboards#principal'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :users do
    resources :users, only: [ :edit, :update]
  end

resources :dashboards do
  collection do
    get 'teste_email'
    get 'forms'
    get 'notification'
    get 'troca_mudulo'
    get :home
    get :exercios
    get :exercios_correto
    get :exercios_incorreto
  end
end

end
