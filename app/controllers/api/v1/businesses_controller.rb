class Api::V1::BusinessesController < ApplicationController
  before_action :set_business, only: %i[ show update destroy ]

  # GET /businesses
  def index
    businesses = Business.all

    render json: business
  end

  # GET /businesses/1
  def show
    render json: @business
  end

  # POST /business
  def create
    @business = Business.new(business_params)

    if @business.save
      render json: @business, status: :created, location: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit(:name, :description)
    end

end