class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		   case resource
	  when Admin
	    admins_top_path
	  when EndUser
	    root_path
	  end
	end

    protected
    def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:kana_last,:kana_first,:zip,:address,:phone_number])
	end
end