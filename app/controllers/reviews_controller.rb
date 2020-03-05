class ReviewsController < ApplicationController
    before_action :set_review, :only => [:show, :edit, :update, :destroy]

    def new
        @review = Review.new(:user_id => params[:user_id])
    end

    def create
        @review = Review.create(review_params)
        redirect_to user_review_path(@current_user, @review)
    end

    def show
    end

    private

    def review_params
        params.require(:review).permit(:studio_name, :rating, :content, :user_id, :studio_id)
    end

    def set_review
        @review = Review.find(params[:id])
    end

end
