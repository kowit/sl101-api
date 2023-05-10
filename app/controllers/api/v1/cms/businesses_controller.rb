class Api::V1::Cms::BusinessesController < ApplicationController
  before_action :set_business, only: %i[show update destroy]

  # GET /businesses/1
  def show
    @business = Business.find(params[:id])
    @promoter = Promoter.find(business.promoter_id)

    business_payload = [
      id: @promoter.id,
      first_name: @promoter.first_name,
      last_name: @promoter.last_name,
      gender: @promoter.gender,
      businesses: [@business.attributes.except("created_at", "updated_at")]
    ]

    if business_payload
      render json: business_payload
    else
      render json: business_payload.errors, status: :unprocessable_entity
    end
  end

  # POST /business
  def create
    ap "\n\nbusiness_params ==> #{business_params}"

    @business = Business.new(business_params)
    @business.description = "" if params[:description].nil?
    @business.phone_num = "" if params[:phone_num].nil?

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
      :website_url,
      :business_type_id,
      :phone_num
    )
  end
end
