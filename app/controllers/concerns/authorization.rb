module Authorization
  extend ActiveSupport::Concern

  class Error < StandardError; end

  included do
    before_action :require_login

    rescue_from Error do |exception|
      render "/public/404", status: 404, layout: "public"
    end
  end

  private

  def require_login
    return if Current.user

    flash[:error] = "You must log in to see this page"
    redirect_to(new_login_path)
  end
end
