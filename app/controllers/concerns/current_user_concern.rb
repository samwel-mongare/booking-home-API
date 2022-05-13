module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    render json: { status: 401, response: 'Please try to login first or Register if you are new' } unless @current_user
  end
end
