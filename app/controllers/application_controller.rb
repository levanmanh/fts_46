class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def home
  end

  private

  def load_subjects
    @subjects = Subject.all
  end

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_url, alert: exception.message
    else
      redirect_to new_user_session_path
    end
  end
end
