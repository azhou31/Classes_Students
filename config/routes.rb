Rails.application.routes.draw do
  
resources :dojos do
  resources :students
end

end
