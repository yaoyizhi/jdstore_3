class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def require_admin
        unless current_user.admin
            redirect_to root_path
            flash[:alert] = 'You are not admin'

          end
    end
end
