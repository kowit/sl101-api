class Api::V1::Cms::PromotersController < ApplicationController
  before_action :set_promoter, only: %i[show update destroy]

  def index
    promoters = Promoter.all

    render json: promoters
  end

  # GET /promoters/1
  def show
    @promoter = Promoter.find(params[:id])
    @business = Business.find_by(promoter_id: @promoter.id)
    @coupons = @business.coupons

    render json: {
             id: @promoter.id,
             firstName: @promoter.first_name,
             lastName: @promoter.last_name,
             email: @promoter.email,
             businesses: [
               {
                 id: @business.id,
                 promoterId: @business.promoter_id,
                 businessTypeId: @business.business_type_id,
                 name: @business.name,
                 description: @business.description,
                 phoneNum: @business.phone_num,
                 coupons: @coupons,
                 websiteUrl: @business.website_url
               }
             ]
          }
  end

  # POST /promoter
  def create
    puts promoter_params

    @promoter = Promoter.new(promoter_params)

    puts "PASSWORD => #{params[:password]}"

    @promoter.first_name = "" if (params[:first_name].nil?)
    @promoter.last_name = "" if (params[:last_name].nil?)
    @promoter.password = params[:password]

    if @promoter.save
      render json: @promoter, status: :created
    else
      render json: @promoter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /promoters/1
  # PATCH/PUT /promoters/1.json
  def update
    if @promoter.update(promoter_params)
      render :show, status: :ok, location: url_for([:api, :v1, @promoter])
    else
      render json: @promoter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /promoters/1
  # DELETE /promoters/1.json
  def destroy
    @promoter.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_promoter
    @promoter = Promoter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def promoter_params
    params.require(:promoter).permit(:email, :first_name, :last_name, :phone_num, :password)
  end
end
