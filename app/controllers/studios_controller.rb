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
        @studio = Studio.new
    end

    def create
    end

    def show
    end

    private

    def studio_params
        params.require(:studio).require(:name, :category)
    end

    def set_studio
        @studio = Studio.find(params[:id])
    end
end
