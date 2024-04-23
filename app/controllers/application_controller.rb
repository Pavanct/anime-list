class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format =~ /^application\/json/ }

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
