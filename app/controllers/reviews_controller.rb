class ReviewsController < ApplicationController

    def new
        @review = Review.new(:user_id => params[:user_id])
    end

    def create
    end

    def show
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :user_ids)
    end

    def set_review
        @review = Review.find(params[:id])
    end


end
