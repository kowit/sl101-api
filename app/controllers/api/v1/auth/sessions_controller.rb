class Api::V1::Auth::SessionsController < ApplicationController
  def signin
    promoter = Promoter.find_by(email: params[:email])
    # business = Business.find_by(promoter_id: promoter.id)
    # coupons = business.coupons

    render json: {
      id: promoter.id,
      firstName: promoter.first_name,
      lastName: promoter.last_name,
      email: promoter.email
    }
  end

  def signout
  end
end
