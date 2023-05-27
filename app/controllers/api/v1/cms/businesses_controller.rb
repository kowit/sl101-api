class Api::V1::Cms::BusinessesController < ApplicationController
  before_action :set_business, only: %i[show update destroy]

  def get_business_by_promoter_id
    puts params
    promoter_businesses = Business.find_by(promoter_id: params[:id])

    puts "~~~~~~~~ -> #{promoter_businesses}"

    if promoter_businesses
      render json: promoter_businesses
    else
      render json: business_payload.errors, status: :unprocessable_entity
    end
  end


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
        promoter: {
          id: promoter.id,
          firstName: promoter.first_name,
          lastName: promoter.last_name,
          email: promoter.email,
          businesses: [@business]
         }
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
      :avatar,
      :logo,
      :name,
      :description,
      :promoter_id,
      :website_url,
      :business_type_id,
      :phone_num
    )
  end
end
