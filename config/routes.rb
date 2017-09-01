Rails.application.routes.draw do

	resources :restaurants, defaults: { format: "json"}
	get '/restaurants/statistics?latitude=x&longitude=y&radius=z', 
	to: 'restaurants#show', defaults: { format: "json"}
end