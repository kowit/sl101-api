class Api::V1::BusinessesController < ApplicationController
  def index
    render json: { id: 1, name: "Test Business" }
  end
end
