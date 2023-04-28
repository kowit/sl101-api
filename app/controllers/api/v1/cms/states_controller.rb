class Api::V1::Cms::StatesController < ApplicationController
  # GET /states
  def index
    @states = State.all

    render json: @states
  end
end
