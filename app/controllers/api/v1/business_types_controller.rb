class Api::V1::BusinessTypesController < ApplicationController
  before_action :set_business_type, only: %i[show update destroy]

  # GET /business_types
  # GET /business_types.json
  def index
    @business_types = BusinessType.all
  end

  # GET /business_types/1
  # GET /business_types/1.json
  def show
  end

  # POST /business_types
  # POST /business_types.json
  def create
    @business_type = BusinessType.new(business_type_params)

    if @business_type.save
      render :show, status: :created, location: @business_type
    else
      render json: @business_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business_types/1
  # PATCH/PUT /business_types/1.json
  def update
    if @business_type.update(business_type_params)
      render :show, status: :ok, location: @business_type
    else
      render json: @business_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /business_types/1
  # DELETE /business_types/1.json
  def destroy
    @business_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_business_type
    @business_type = BusinessType.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def business_type_params
    params.require(:business_type).permit(:name)
  end
end
