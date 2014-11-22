class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def dropbox_oauth2
    @user = User.where(dropbox_uid: request.env["omniauth.auth"]).first_or_create

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.dropbox_data"] = request.env["omniauth.auth"]
      redirect_to new_event_path
    end
  end
end
