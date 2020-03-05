class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if !User.find_by(:username => params[:username]).nil?
            @user = User.find_by(:username => params[:username])
            if @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to @user
            else
                render 'sessions/new'
            end
        else
            flash[:notice] = "You must sign up before logging in!!"
            redirect_to '/signup'
        end
    end

    def destroy
        session.destroy
        redirect_to '/'
    end

end
