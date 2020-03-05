class UsersController < ApplicationController
    before_action :set_user, :only => [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user 
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end


    def destroy
        @user.destroy && session.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

end
