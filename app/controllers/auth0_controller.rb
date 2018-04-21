class Auth0Controller < ApplicationController
  include LogoutHelper
  def logout
      reset_session
      redirect_to logout_url.to_s
  end

  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    find_or_create_user
    # Redirect to the URL you want after successful auth
    redirect_to '/books'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  private

    def find_or_create_user
        email_id=session[:userinfo]["info"]["email"]
        User.find_or_create_by!(email: email_id)
    end
end
