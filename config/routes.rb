Rails.application.routes.draw do
  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Group_member resource:
  # CREATE
  get "/group_members/new", :controller => "group_members", :action => "new"
  post "/create_group_member", :controller => "group_members", :action => "create"

  # READ
  get "/group_members", :controller => "group_members", :action => "index"
  get "/group_members/:id", :controller => "group_members", :action => "show"

  # UPDATE
  get "/group_members/:id/edit", :controller => "group_members", :action => "edit"
  post "/update_group_member/:id", :controller => "group_members", :action => "update"

  # DELETE
  get "/delete_group_member/:id", :controller => "group_members", :action => "destroy"
  #------------------------------

  # Routes for the Group resource:
  # CREATE
  get "/groups/new", :controller => "groups", :action => "new"
  post "/create_group", :controller => "groups", :action => "create"

  # READ
  get "/groups", :controller => "groups", :action => "index"
  get "/groups/:id", :controller => "groups", :action => "show"

  # UPDATE
  get "/groups/:id/edit", :controller => "groups", :action => "edit"
  post "/update_group/:id", :controller => "groups", :action => "update"

  # DELETE
  get "/delete_group/:id", :controller => "groups", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
