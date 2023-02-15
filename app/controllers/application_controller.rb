class ApplicationController < ActionController::Base
  def homepage
    render({ :template => "users.html.erb" })
  end

  def user_details
    @the_user = User.all.where({ :username => params["user_name"] })[0]
    render({ :template => "user_details.html.erb" })
  end

  def photos
    render({ :template => "photos.html.erb" })
  end

  def photo_details
    @the_photo = Photo.all.where({ :id => params["path_id"] })[0]
    render({ :template => "photo_details.html.erb" })
  end

  def add_user
    new_user = User.new
    new_user.username = params["username_input"]
    new_user.save
    redirect_to("/users/" + new_user.username.to_s)
  end

  def edit_user
    @the_user = User.where({ :id => params["user_id"] })[0]
    @the_user.update({ :username => params["user_edits"] })
    redirect_to("/users/" + @the_user.username)
  end

  def add_photo
    new_photo = Photo.new
    new_photo.update({ :image => params["image_input"],
                       :caption => params["caption_input"],
                       :owner_id => params["owenrid_input"] })
    new_photo.save
    @the_photo = new_photo
    redirect_to("/photos/" + @the_photo.id.to_s)
  end

  def update_photo
    updated_photo = Photo.where({ :id => params["photo_id"] })[0]
    updated_photo.update({ :image => params["photo_edits"],
                           :caption => params["caption_edits"] })
    @the_photo = updated_photo
    redirect_to("/photos/" + @the_photo.id.to_s)
  end

  def delete_photo
    Photo.where({ :id => params["photo_id"].to_i }).destroy_all
    redirect_to("/photos")
  end

  def add_comment
    new_comment = Comment.new
    new_comment.update({ :photo_id => params["photo_commented"].to_i,
                         :author_id => params["author_commenting"].to_i,
                         :body => params["comment_added"] })
    redirect_to("/photos/" + new_comment.photo_id.to_s)
  end
end
