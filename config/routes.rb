Rails.application.routes.draw do
  # Devise est une gem qui gère l'authentification de A à Z
  devise_for :users
  # configurer chemin de base
  root 'homes#index'

  resources :advertisements do
    resources :comments, only: [:create, :destroy]
    # crée les routes :
    #advertisement_comments POST   /advertisements/:advertisement_id/comments(.:format)     comments#create
    #advertisement_comment DELETE /advertisements/:advertisement_id/comments/:id(.:format) comments#destroy
  end

  resources :ad_verifies
  resources :manage_users
  resources :categories

end
