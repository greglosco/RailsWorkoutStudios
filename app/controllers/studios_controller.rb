class StudiosController < ApplicationController
    before_action :set_studio, :only => [:show, :edit, :update, :destroy]

    # def index_all 
    #     @studios = Studio.all
    # end
    
    def index
        if params[:user_id]
            @user = User.find_by(:id => params[:user_id])
            @studios = @user.studios
        else
            @studios = Studio.all
        end
    end

    def new
        @studio = Studio.new
    end

    def create
        @studio = Studio.create(studio_params)
        if @studio.valid?
            redirect_to user_studio_path(@current_user, @studio)
        else
            render :new
        end
    end

    def show
    end

    def edit
        if @studio && @studio.user == @current_user
        else redirect_to '/studios'
        end
    end

    def update
        @studio.update(studio_params)
        redirect_to user_studio_path(@current_user, @studio)
    end

    def destroy
        if @studio && @studio.user == @current_user
            @studio.destroy 
            redirect_to user_studios_path(@current_user)
        else redirect_to '/studios'
        end
    end

    private

    def studio_params
        params.require(:studio).permit(:name, :category, :user_id)
    end

    def set_studio
        @studio = Studio.find(params[:id])
    end
end
