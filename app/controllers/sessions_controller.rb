class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.username = auth['info']['nickname']
                u.email = auth['info']['email']
                u.password = SecureRandom.uuid
             end
             session[:user_id] = @user.id
             redirect_to @user
        else
            @user = User.find_by(:username => params[:user_name])
            @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        end
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
