Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })
  get("/users", { :controller => "application", :action => "homepage" })
  get("/users/:user_name", { :controller => "application", :action => "user_details" })
  get("/add_user", { :controller => "application", :action => "add_user" })
  get("/edit_user/:user_id", { :controller => "application", :action => "edit_user" })

  get("/photos", { :controller => "application", :action => "photos" })
  get("/photos/:path_id", { :controller => "application", :action => "photo_details" })
  get("/delete_photo/:photo_id", { :controller => "application", :action => "delete_photo" })
  get("/update_photo/:photo_id", { :controller => "application", :action => "update_photo" })
  get("/add_photo", { :controller => "application", :action => "add_photo" })
  get("/add_comment/:photo_id", { :controller => "application", :action => "add_comment" })
end
