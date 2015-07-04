class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def check_current_user
      fails unless current_user
    rescue
      redirect_to new_user_session_path, notice: 'Access denied'
    end
end
