class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  check_authorization unless: :devise_controller?
  


  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, alert:  exception.message #導向另一個頁面
  end

  #render json: "Authorization failed. 權限錯誤，請洽管理人員。
  #render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  #respond_to do |format|
    #format.json { render nothing: true, status: :forbidden }
    #format.html { redirect_to main_app.root_url, :alert => exception.message }
  #end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  end

  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end
end
