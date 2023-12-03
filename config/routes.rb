Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "submissions", :action => "home" })
  get("/write", { :controller => "submissions", :action => "write" })
  post("/submit", { :controller => "submissions", :action => "submit" })
  get("/submissions", { :controller => "submissions", :action => "index" })
  get("/submissions/:path_id", { :controller => "submissions", :action => "show" })
  post("/modify_submission/:path_id", { :controller => "submissions", :action => "update" })
  get("/delete_submission/:path_id", { :controller => "submissions", :action => "destroy" })

  # Defines the root path route ("/")
  # root "articles#index"
end
