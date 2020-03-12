class ReviewsController < ApplicationController
    before_action :set_review, :only => [:show, :edit, :update, :destroy]

    # def index_all
    #     @reviews = Review.all
    # end
    
    def index
        if params[:user_id]
            @user = User.find_by(:id => params[:user_id])
            @reviews = @user.reviews
        elsif params[:studio_id]
            @studio = Studio.find_by(:id => params[:studio_id])
            @reviews = @studio.reviews 
        else
            @reviews = Review.all 
        end
    end

    def five_stars
        @five_star_reviews = Review.five_stars
    end

    def new
        @review = Review.new(:user_id => params[:user_id])
    end

    def create
        @review = Review.create(review_params)
        if @review.valid?
            redirect_to user_review_path(@current_user, @review)
        else
            render :new
        end
    end

    def show
    end

    def edit
        if @review && @review.user == @current_user
        else redirect_to '/reviewindex'
        end
    end

    def update
        @review.update(review_params)
        redirect_to user_review_path(@current_user, @review)
    end

    def destroy
        if @review && @review.user == @current_user
            @review.destroy 
            redirect_to user_reviews_path(@current_user)
        else redirect_to '/reviewindex'
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :user_id, :studio_id)
    end

    def set_review
        @review = Review.find(params[:id])
    end

end
