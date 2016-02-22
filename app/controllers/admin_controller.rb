class AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def authenticate_admin!
    if current_user.present?
      respond_to do |format|
        format.html { redirect_to admin_user_session_path }
        format.json { render json: 'Forbidden.', status: 422 }
      end
    end
  end
end