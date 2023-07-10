class Api::V1::Cms::CouponsTableController < ApplicationController
  def index
    puts "~PARAMS #{params}"
    puts "~PARAMS #{params[:id]}"
    coupons = Coupon.where(business_id: params[:id])
    transformed_coupons = Coupon.get_transform_coupons_for_coupons_table(coupons)
    render json: transformed_coupons
  end
end
