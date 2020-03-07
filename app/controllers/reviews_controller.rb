class ReviewsController < ApplicationController
    before_action :set_review, :only => [:show, :edit, :update, :destroy]

    def index
        @user = User.find_by(:id => params[:user_id])
        @reviews = @user.reviews
    end

    def new
        @review = Review.new(:user_id => params[:user_id])
    end

    def create
        @review = Review.create(review_params)
        redirect_to user_review_path(@current_user, @review)
    end

    def show
    end

    def edit
    end

    def update
        @review.update(review_params)
        redirect_to user_review_path(@current_user, @review)
    end

    def destroy
        @review.destroy 
        redirect_to user_reviews_path(@current_user)
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :user_id, :studio_id)
    end

    def set_review
        @review = Review.find(params[:id])
    end

end
