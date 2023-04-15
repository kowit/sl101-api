class Api::V1::CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.all

    # render json: @categories
    render json: [
      { name: 'eats' },
      { name: 'beauty' }
    ]
  end
end
