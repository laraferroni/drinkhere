class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  protect_from_forgery # Same as above
  set_current_tenant_by_subdomain(:account, :subdomain)

  before_filter :get_subdomain, :set_achievements, :set_account
  
  
	
  private
	  def get_subdomain
	    return request.subdomain
	  end

    def set_achievements
      if current_user
        @user_achievements = current_user.achievements
      else
        @user_achievements = []
      end

    end

    def set_account
      @settings = Setting.first
    end
end
