require 'pry'

class StudiosController < ApplicationController
    before_action :set_studio, :only => [:show, :edit, :update, :destroy]

    def index
        @user = User.find_by(:id => params[:user_id])
        @studios = @user.studios
    end

    def new
        @studio = Studio.new(:user_ids => params[:user_id])
    end

    def create
        @studio = Studio.create(studio_params)
        redirect_to user_studio_path(@current_user, @studio)
    end

    def show
    end

    def edit
    end

    def update
        @studio.update(studio_params)
        redirect_to user_studio_path(@current_user, @studio)
    end

    def destroy
        @studio.destroy 
        redirect_to user_studios_path(@current_user)
    end


    private

    def studio_params
        params.require(:studio).permit(:name, :category, :user_ids, :review_id)
    end

    def set_studio
        @studio = Studio.find(params[:id])
    end
end
