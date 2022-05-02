class Api::V1::ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
    render json: ApartmentsRepresenter.new(@apartments).as_json
  end

  def create
    @apartment = Apartment.create(apartment_params.merge(owner_id: 1))

    if @apartment.save
      if @apartment.rental
        @rental = Rental.create(rental_params.merge(apartment_id: @apartment.id))
      else
        Market.create(market_params.merge(apartment_id: @apartment.id))
      end

      if @apartment.favourite
        @user_apartment = UserApartment.create(user_id: 1, apartment_id: @apartment.id)
      end
      render json: ApartmentRepresenter.new(@apartment).as_json, status: :created
    else
      render json: {
        message: "Apartment not listed",
        error: @apartment.errors,
        status: :unprocessable_entity
      }, status: :unprocessable_entity
    end
  end

  def update
    @apartment = Apartment.find(params[:id])
    @apartment.update(apartment_params)
    if @apartment.save
      if @apartment.favourite
        @user_apartment = UserApartment.create(user_id: 1, apartment_id: @apartment.id)
      else 
        @user_apartment = UserApartment.where(user_id: 1, apartment_id: @apartment.id).first
        @user_apartment.destroy
      end
    end
  end

    def destroy
      @apartment = Apartment.find(params[:id]).destroy!
      head :no_content
    end

  private

  def apartment_params
    params.require(:apartment).permit(:name, :description, :location, :rental, :image1, :image2, :image3, :favourite)
  end

  def rental_params
    params.require(:rental).permit(:price , :period)
  end

  def market_params
    params.require(:market).permit(:price)
  end
end
