class Api::v1::PostsController < ApplicationController
  def index
    render json: { id: 1, name: "Test Post!" }
  end
end