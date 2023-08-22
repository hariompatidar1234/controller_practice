Rails.application.routes.draw do
#  get "/posts/:status", to:  "posts#index"  #rounting parameter
 get "/posts/", to:  "posts#index"
#  get "/urlposts", to:  "posts#create"
 post "/urlposts", to: "posts#create"
end
