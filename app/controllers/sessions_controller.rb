class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['nickname']
            u.email = auth['info']['email']
            u.password = SecureRandom.uuid
        end
        @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
    end

    def destroy
        session.destroy
        redirect_to '/'
    end

    private
     
      def auth
        request.env['omniauth.auth']
      end

end
