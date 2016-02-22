class Admin::UserSessionsController < AdminController

  skip_before_action :authenticate_admin!
  before_action :build_user_session, only: :create
  before_action :check_current_user, only: :new

  def new
    @user_session = UserSession.new
  end

  def create
    respond_to do |format|
      if @user_session.save
        format.html { redirect_to after_sign_in_path, success: 'Logged in.' }
        format.json { render json: { user: current_user.only(:id) } }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { errors: @user_session.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if current_user_session && current_user_session.destroy
        format.html { redirect_to root_path, message: 'Successfully logged out.' }
        format.json { render json: { message: "Successfully destroyed." }, status: 200 }
      else
        format.html { redirect_to dashboard_path, error: 'Not found.', status: 404 }
        format.json { render json: { error: ["Not found."] }, status: 404 }
      end
    end
  end

  private
  def after_sign_in_path
    if current_user.admin?
      admin_root_path
    end
  end

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end

  def build_user_session
    @user_session = UserSession.new user_session_params
  end

  def check_current_user
    if current_user
      respond_to do |format|
        format.html { redirect_to admin_root_path, message: 'You are already logged in.' }
        format.json { render json: { errors: 'You are already logged in.' }, status: 403 }
      end
    end
  end
end