class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def dropbox_oauth2
    @user = User.where(dropbox_uid: request.env["omniauth.auth"]["uid"]).first_or_create

    session[:user_id] = @user.id

    if @user.events.exists?
      redirect_to @user.events.first
    else
      redirect_to new_event_path
    end
  end
end
