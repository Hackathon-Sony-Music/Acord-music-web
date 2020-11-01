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

  # resources :users do
  #   collection do
  #     get :update_dados_registros
  #   end
  # end
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
    get :minhas_musicas
    get :artistas
    get :produtoras
    get :hits
    get :relatorios
    get :letras
    get :artistas_produtara
    get :producoes
    get :relatorios_stream
  end
end

resources :registros do
  collection do
    get :update_dados_registros
    get :box_1
    get :box_1_1
    get :box_1_1_2
    get :box_1_1_3
    get :box_1_1_4
    get :box_1_2
    get :box_1_2_2
    get :box_1_2_3
    get :box_1_2_4

    # patch :
    get :box_1_update
    patch :box_1_1_update
    patch :box_1_1_2_update
  end
end

end
