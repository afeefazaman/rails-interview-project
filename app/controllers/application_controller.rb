class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_tenant!

  protected

  def authenticate_tenant!
    if current_tenant
      current_tenant.valid_request? && current_tenant.increment_count! || limit_reached
    else
      bad_request
    end
  end

  def current_tenant
    @tenant ||= Tenant.find_by(api_key: request.headers['HTTP_API_KEY'])
  end

  private

  def limit_reached
    return render plain: 'You need to wait for 10 seconds before making another request', status: :unauthorized
  end

  def bad_request
    return render plain: 'Bad Request', status: :unauthorized
  end
end
