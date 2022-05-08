Rails.application.routes.draw do
  get 'application/index'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'layouts/application'
  root 'layouts#application'

end
