Rails.application.routes.draw do
<<<<<<< HEAD
 # Custom route for listing all posts
 get "/posts", to: "posts#index"

 # Custom route for creating a post
 post "/urlposts", to: "posts#create"

 # Custom route for showing a specific post
 get "/posts/show/:id", to: "posts#show"

 # Custom route for updating a specific post
 put "/posts/update/:id", to: "posts#update"
 patch "/posts/update/:id", to: "posts#update" # You can also use PATCH

 # Custom route for deleting a specific post
 delete "/posts/delete/:id", to: "posts#destroy"
=======
#  get "/posts/:status", to:  "posts#index"  #rounting parameter
 get "/posts/", to:  "posts#index"
#  get "/urlposts", to:  "posts#create"
 get "/posts/show/:id", to: "posts#show"
  post "/urlposts", to: "posts#create"
>>>>>>> 1e0ae2c (add update mathod in controller)
end
