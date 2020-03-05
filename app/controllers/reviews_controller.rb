class ReviewsController < ApplicationController

    def new
        @review = Review.new
    end

    def create
    end

    def show
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content)
    end

    def set_review
        @review = Review.find(params[:id])
    end


end
