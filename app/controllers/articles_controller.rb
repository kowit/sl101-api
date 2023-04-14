class ArticlesController < ApplicationController
  def index
    render json: { id: 1, name: "Test Article" }
  end
end
