class Admin::ApplicationController < ActionController::Base

    # redirect_to root_path unless current_user.admin

    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { head :forbidden }
          format.html { redirect_to root_path, notice: exception.message }
        end
      end
end
