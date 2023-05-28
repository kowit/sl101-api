class Api::V1::Analytics::BusinessesController < ApplicationController
  def phone_clicks
    render json: { phoneClicks: 49 }
  end

  def website_clicks
      render json: { websiteClicks: 1091 }
  end

  def business_clicks
    render json: { businessClicks: 3212 }
  end

  def subscribers_count
    render json: { subscribersCount: 144 }
  end


  def business_clicks_over_time
    render json: [
      {
        count: 200,
        date: '5/1/23'
      },
      {
        count: 329,
        date: '5/2/23'
      },
       {
        count: 299,
        date: '5/4/23'
      },
      {
        count: 549,
        date: '5/6/23'
      },
      {
        count: 140,
        date: '5/7/23'
      },
      {
        count: 302,
        date: '5/8/23'
      }
    ]
  end
end
