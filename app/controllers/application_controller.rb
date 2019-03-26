class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
      def after_sign_in_path_for(resource)
        if resource.is_a?(User)
          if User.count == 1
            resource.add_role 'admin'
          end
          resource
        end
        root_path
      end
  protected
 
  def authenticate_admin
    unless current_user.admin?
      # flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  def authenticate_client
    unless current_user.client?
      # flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to articles_path, :alert => exception.message
    #return exception.action, exception.subject
  end

end
