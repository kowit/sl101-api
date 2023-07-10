class Api::V1::Auth::SessionsController < ApplicationController

  # def on_auth_state_changed
  #   puts "~params #{session[:id]}"
  #   puts "~session #{session[:current_promoter_id]}"

  #   if (params[:id].nil? || session[:current_promoter_id].nil?)
  #     render json: { message: "Not authorized" }, status: :unauthorized
  #   end
  # end

  def signin
    @promoter = Promoter.find_by(email: params[:email])

    session[:current_promoter_id] = @promoter.id

    session.keys.each do |key|
      p "#{key} => #{session[key]}"
    end
    ap "~~~~~~~~~~~ #{session[:current_promoter_id]}"

    if (!@promoter.nil?)
      session[:current_promoter_id] = @promoter.id

      business = Business.find_by(promoter_id: @promoter.id)

      render json: {
        promoter: {
          id: @promoter.id,
          firstName: @promoter.first_name,
          lastName: @promoter.last_name,
          email: @promoter.email,
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
      }, status: :ok
    end
  end

  def signout
  end

  private

  def session_params
    params.require(:promoter).permit(:id)
  end
end
