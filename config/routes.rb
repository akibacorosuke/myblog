Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #記事に紐づいた形で設定していく
  resources :posts do 
  	resources :comments
  end

  root 'posts#index'

end
