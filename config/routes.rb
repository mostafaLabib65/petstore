Rails.application.routes.draw do
  post 'auctions/bid'
  get 'auctions/index'
  get 'auctions/earnings'
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
