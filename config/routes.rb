Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "submissions", :action => "home" })
  get("/write", { :controller => "submissions", :action => "write" })
  post("/submit", { :controller => "submissions", :action => "submit" })
  get("/submissions", { :controller => "submissions", :action => "index" })


  # Defines the root path route ("/")
  # root "articles#index"
end
