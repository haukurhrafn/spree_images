Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :images, controller: :site_images
  end
end
