class Api::V1::Cms::CitiesController < ApplicationController
  # GET /cities
  def index
    @cities = City.all

    render json: [{ name: "Tampa" }, { name: "St. Petersburg" }]
  end
end
