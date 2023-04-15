class Api::V1::StatesController < ApplicationController
  # GET /states
  def index
    @states = State.all

    render json: @states
  end
end
