class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    # respond with unauthorized
    @user = session[:user_id] ? User.find_by(id: session[:user_id]) : nil
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @user
  end
end
