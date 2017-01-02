Rails.application.routes.draw do
  # Routes for the Touchpoint resource:
  # CREATE
  get "/touchpoints/new", :controller => "touchpoints", :action => "new"
  post "/create_touchpoint", :controller => "touchpoints", :action => "create"

  # READ
  get "/touchpoints", :controller => "touchpoints", :action => "index"
  get "/touchpoints/:id", :controller => "touchpoints", :action => "show"

  # UPDATE
  get "/touchpoints/:id/edit", :controller => "touchpoints", :action => "edit"
  post "/update_touchpoint/:id", :controller => "touchpoints", :action => "update"

  # DELETE
  get "/delete_touchpoint/:id", :controller => "touchpoints", :action => "destroy"
  #------------------------------

  # Routes for the Recruiting_event resource:
  # CREATE
  get "/recruiting_events/new", :controller => "recruiting_events", :action => "new"
  post "/create_recruiting_event", :controller => "recruiting_events", :action => "create"

  # READ
  get "/recruiting_events", :controller => "recruiting_events", :action => "index"
  get "/recruiting_events/:id", :controller => "recruiting_events", :action => "show"

  # UPDATE
  get "/recruiting_events/:id/edit", :controller => "recruiting_events", :action => "edit"
  post "/update_recruiting_event/:id", :controller => "recruiting_events", :action => "update"

  # DELETE
  get "/delete_recruiting_event/:id", :controller => "recruiting_events", :action => "destroy"
  #------------------------------

  # Routes for the Firm resource:
  # CREATE
  get "/firms/new", :controller => "firms", :action => "new"
  post "/create_firm", :controller => "firms", :action => "create"

  # READ
  get "/firms", :controller => "firms", :action => "index"
  get "/firms/:id", :controller => "firms", :action => "show"

  # UPDATE
  get "/firms/:id/edit", :controller => "firms", :action => "edit"
  post "/update_firm/:id", :controller => "firms", :action => "update"

  # DELETE
  get "/delete_firm/:id", :controller => "firms", :action => "destroy"
  #------------------------------

  # Routes for the Contact resource:
  # CREATE
  get "/contacts/new", :controller => "contacts", :action => "new"
  post "/create_contact", :controller => "contacts", :action => "create"

  # READ
  get "/contacts", :controller => "contacts", :action => "index"
  get "/contacts/:id", :controller => "contacts", :action => "show"

  # UPDATE
  get "/contacts/:id/edit", :controller => "contacts", :action => "edit"
  post "/update_contact/:id", :controller => "contacts", :action => "update"

  # DELETE
  get "/delete_contact/:id", :controller => "contacts", :action => "destroy"
  #------------------------------

  # Routes for the Follow_up resource:
  # CREATE
  get "/follow_ups/new", :controller => "follow_ups", :action => "new"
  post "/create_follow_up", :controller => "follow_ups", :action => "create"

  # READ
  get "/follow_ups", :controller => "follow_ups", :action => "index"
  get "/follow_ups/:id", :controller => "follow_ups", :action => "show"

  # UPDATE
  get "/follow_ups/:id/edit", :controller => "follow_ups", :action => "edit"
  post "/update_follow_up/:id", :controller => "follow_ups", :action => "update"

  # DELETE
  get "/delete_follow_up/:id", :controller => "follow_ups", :action => "destroy"
  #------------------------------

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
