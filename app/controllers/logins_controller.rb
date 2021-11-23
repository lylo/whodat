class LoginsController < ApplicationController
  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def create
    if user = authenticate_with_google
      Current.user = user
      sign_in(user)
      redirect_to root_path
    else
      redirect_to new_login_path, alert: 'authentication_failed'
    end
  end

  private
    def authenticate_with_google
      if id_token = flash["google_sign_in"]["id_token"]
        identity = GoogleSignIn::Identity.new(id_token)
        unless user = User.find_by(google_id: identity.user_id)
          user = User.create(google_id: identity.user_id, email: identity.email_address)
        end
        user
      elsif error = flash["google_sign_in"]["error"]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
end
