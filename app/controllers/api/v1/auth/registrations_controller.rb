class Api::V1::Auth::RegistrationsController < ApplicationController
  def new
    @promoter = Promoter.new
  end

  # POST /signup
  def signup
    puts "\n\nparams=> #{params}"

    # Create promoter
    promoter =
      Promoter.new(
        email: params[:email],
        password: params[:password],
        first_name: params[:first_name],
        last_name: params[:last_name]
      )

    if promoter.save!
      session[:promoter_id] = promoter.id
      puts "#{session}"
      ap "#{session[:promoter_id]}"

      render json: {
        id: promoter.id,
        firstName: promoter.first_name,
        lastName: promoter.last_name,
        email: promoter.email,
        businesses: []
      }
    else
      render json: payload.errors, status: :unprocessable_entity
    end
  end
end
