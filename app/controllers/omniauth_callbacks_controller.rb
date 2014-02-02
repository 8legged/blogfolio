class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    # raise request.env["omniauth.auth"].to_yaml

    if user.persisted?
      flash[:notice] = "Signed in!"
      sign_in_and_redirect user, notice: "#{user.name}, you are signed in!"
    else
      session["devise.user_attributes"] = user_attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method  :twitter, :all
end
