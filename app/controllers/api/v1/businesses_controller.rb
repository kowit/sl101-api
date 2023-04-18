class Api::V1::BusinessesController < ApplicationController
  before_action :set_business, only: %i[show update destroy]

  # GET /businesses
  def index
    @businesses = Business.all

    render json: @businesses
  end

  # GET /businesses/1
  def show
    @business = Business.find(params[:id])

    render json: @business
  end

  # POST /business
  def create
    puts "\n\nbusiness_params ==> #{business_params}"

    @business = Business.new(business_params)
    @business.description =  if (params[:description]) === ''

    if @business.save
      render json: @business,
             status: :created,
             location: url_for([:api, :v1, @business])
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
    params.require(:business).permit(
      :name,
      :description,
      :promoter_id,
      :business_type_id,
      :phone_num
    )
  end
end
