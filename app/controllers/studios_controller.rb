class StudiosController < ApplicationController

    def index
        @studios = Studio.all
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
end
