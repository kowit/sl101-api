class Api::V1::Analytics::BusinessesController < ApplicationController
  def phone_clicks
    render json: { phoneClicks: 57 }
  end

  def website_clicks
      render json: { websiteClicks: 242 }
  end

  def business_clicks
    render json: { businessClicks: 210 }
  end

  def subscribers_count
    render json: { subscribersCount: 117 }
  end


  def business_clicks_over_time
    render json: [
      {
        count: 200,
        date: '5/1'
      },
      {
        count: 529,
        date: '5/2'
      },
       {
        count: 699,
        date: '5/4'
      },
      {
        count: 549,
        date: '5/6'
      },
      {
        count: 140,
        date: '5/7'
      },
      {
        count: 302,
        date: '5/8'
      }
    ]
  end
end
