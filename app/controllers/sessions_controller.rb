class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        auth = request.env["omniauth.auth"]
        if auth
          sign_in_with_auth(auth)
        else
          sign_in_with_password
        end
      end

    def destroy
        session.destroy
        redirect_to '/'
    end

end
