class Api::V1::PromotersController < ApplicationController
  before_action :set_promoter, only: %i[show update destroy]

  # GET /promoters
  def index
    @promoters = Promoter.all

    render json: @promoters
  end

  # GET /promoters/1
  def show
    @promoter = Promoter.find(params[:id])

    render json: @promoter
  end

  # POST /promoter
  def create
    puts promoter_params
    logger.debug "promoter params => #{promoter_params}"

    @promoter = Promoter.new(promoter_params)
    @promoter.first_name = "" if (params[:first_name].nil?)
    @promoter.last_name = "" if (params[:last_name].nil?)

    if @promoter.save
      render json: @promoter,
             status: :created,
             location: url_for([:api, :v1, @promoter])
    else
      render json: @promoter.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_promoter
    @promoter = Promoter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def promoter_params
    params.require(:promoter).permit(:email, :first_name, :last_name)
  end
end