class UsersController < ApplicationController
    before_action :set_user, :only => [:show, :edit, :update, :destroy]

    def index
        @studio = Studio.find_by(:id => params[:studio_id])
        @user = @studio.user 
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
    end

    def edit
        if @user && @user == @current_user
        else redirect_to @current_user
        end
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end


    def destroy
        if @user && @user == @current_user
            @user.destroy && session.destroy
            redirect_to root_path
        else redirect_to @current_user
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :studio_id)
    end

    def set_user
        @user = User.find(params[:id])
    end

end
