class Api::V1::Cms::SessionsController < ApplicationController
  def signin
    puts "params ===> #{params}"

    @promoter = Promoter.find_by(email: params[:email])

    @business = Business.find_by(promoter_id: @promoter.id)
    @coupons = @business.coupons

    render json: [
             id: @promoter.id,
             firstName: @promoter.first_name,
             lastName: @promoter.last_name,
             businesses: [
               {
                 id: @business.id,
                 promoterId: @business.promoter_id,
                 businessTypeId: @business.business_type_id,
                 name: @business.name,
                 description: @business.description,
                 phoneNum: @business.phone_num,
                 coupons: @coupons
               }
             ]
           ]
  end

  def signout
  end
end
