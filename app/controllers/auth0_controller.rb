class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    @current_user=find_or_create_user
    # Redirect to the URL you want after successful auth
    redirect_to '/books'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  private

  def find_or_create_user
        auth0_user=session[:userinfo]
        email_id=auth0_user["info"]["email"]
        user=User.find_or_create_by!(email: email_id)
        user.info=auth0_user["info"]
        return user
  end 
end
