Rails.application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
  	namespace :v1 do
  		resources :search do
  			collection do
  				get :search_all
  			end
  		end
  	end
  end
end
