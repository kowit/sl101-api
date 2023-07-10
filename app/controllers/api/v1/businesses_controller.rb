class Api::V1::BusinessesController < ApplicationController
  before_action :set_business, only: %i[show update destroy]

  # def get_business_by_promoter_id
  #   puts "params => #{params}"
  #   @business = Business.find_by(promoter_id: params[:id])

  #   if @business
  #     render json: {
  #       id: @business.id,
  #       name: @business.name,
  #       createdAt: @business.created_at,
  #       updatedAt: @business.updated_at,
  #       businessTypeId: @business.business_type_id,
  #       phoneNum: @business.phone_num,
  #       websiteUrl: @business.website_url
  #     }
  #   else
  #     render json: @business.errors, status: :unprocessable_entity
  #   end
  # end


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
    @business = Business.new(business_params)


    @business.description = "" if (params[:description].nil?)

    if @business.save
      puts "~business saved => #{@business}"

      promoter = Promoter.find_by(id: business_params[:promoter_id])

      render json: {
        id: promoter.id,
        firstName: promoter.first_name,
        lastName: promoter.last_name,
        email: promoter.email,
        businesses: [@business]
      }
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
      :phone_num,
    )
  end
end
