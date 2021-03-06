class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :authenticate_user!

  private

  def record_not_found
    respond_to do |f|
      f.html { render 'errors/404', status: 404 }
      f.json { head :no_content, status: 404 }
    end
  end
end
