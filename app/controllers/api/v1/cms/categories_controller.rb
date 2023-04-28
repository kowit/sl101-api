class Api::V1::Cms::CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.all

    # render json: @categories
    render json: [{ name: "eats" }, { name: "beauty" }]
  end
end
