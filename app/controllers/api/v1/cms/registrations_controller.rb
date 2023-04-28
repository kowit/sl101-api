class Api::V1::Cms::RegistrationsController < ApplicationController
  def new
    @promoter = Promoter.new
  end

  # POST /signup
  def signup
    promoter =
      Promoter.new(
        email: params[:email],
        first_name: params[:first_name],
        last_name: params[:last_name],
        password: params[:password]
      )

    if promoter.save!
      session[:promoter_id] = promoter.id
      puts "#{session}"
      ap "#{session[:promoter_id]}"
      render json: promoter, status: :created
    else
      render json: promoter.errors, status: :unprocessable_entity
    end
  end
end
