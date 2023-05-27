# frozen_string_literal: true

class CitiesController < ApplicationController
  before_action :set_city, only: %i[edit update]

  def index
    @q = City.ransack(params[:q])
    @cities = @q.result(distinct: true).includes(:address).paginate(
      page:     params[:page],
      per_page: params[:per_page]
    )
  end

  def new
    @city = City.new
    @city.build_address
  end

  def edit; end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to cities_path, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to cities_path, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:full_name, :cpf, :cns, :email, :phone_number, :birth_date, :active, :picture,
                                 address_attributes: %i[id cep street neighborhood city_name state])
  end
end
