module Auth0Helper
private
    def user_signed_in?
        session[:userinfo].present?
    end
    
    def authenticate_user!
        if user_signed_in?
            @current_user
        else
            redirect_to login_path
        end
    end
    
    def login_path
        root_path
    end

    def current_user
        @current_user
    end

end
