module SessionsHelper

    def sign_in_with_auth(auth)
        @user = User.find_or_create_from_auth_hash(auth_hash)
        self.current_user = @user
        redirect_to @user
    end

      def sign_in_with_password
        @user = User.find_by(:username => params[:username])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            render 'sessions/new'
        end
    end

end
