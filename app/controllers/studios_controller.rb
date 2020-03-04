class StudiosController < ApplicationController
    before_action :set_studio, :only => :show

    def index
        if params[:user_id]
            @studios = User.find(params[:user_id]).studios
        else
            @studios = Studio.all
        end
    end

    def new
        @studio = Studio.new(:user_ids => params[:user_id])
    end

    def create
        @studio = Studio.create(studio_params)
        redirect_to @studio
    end

    def show
    end

    private

    def studio_params
        params.require(:studio).permit(:name, :category, :user_ids)
    end

    def set_studio
        @studio = Studio.find(params[:id])
    end
end
