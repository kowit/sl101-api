class Api::V1::Analytics::CouponsController < ApplicationController
  def impressions
    render json: { impressions: 49 }
  end

  def clicks
    render json: { clicks: 1091 }
  end

  def redemptions
    render json: { redemptions: 3212 }
  end
end
