Rails.application.routes.draw do
  resources :locations
  resources :workorders
  resources :technicians
  root to: "schedule#index"
end
