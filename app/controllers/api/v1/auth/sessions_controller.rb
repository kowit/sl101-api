class Api::V1::Auth::SessionsController < ApplicationController
  def signin
    promoter = Promoter.find_by(email: params[:email])

    if (!promoter.nil?)
      business = Business.find_by(promoter_id: promoter.id)
      render json: {
        promoter: {
          id: promoter.id,
          firstName: promoter.first_name,
          lastName: promoter.last_name,
          email: promoter.email,
        },
        business: {
          id: business.id,
          name: business.name,
          description: business.description,
          promoterId: business.promoter_id,
          businessTypeId: business.business_type_id,
          phoneNum: business.phone_num,
          websiteUrl: business.website_url
        }
      }
    end
  end

  def signout
  end
end
