module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
    helper_method :logged_in?
  end

  private

  def logged_in?
    Current.user.present?
  end

  def authenticate
    if authenticated_user = User.find_by(id: session[:user_id])
      Current.user = authenticated_user
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end
