# rubocop:disable Style/GuardClause

class Api::V1::ApartmentsController < ApplicationController
  include CurrentUserConcern

  def index
    @apartments = Apartment.all
    render json: ApartmentsRepresenter.new(@apartments).as_json
  end

  def show
    @apartment = Apartment.find(params[:id])
    render json: ApartmentRepresenter.new(@apartment).as_json
  end

  def create
    @apartment = Apartment.create(apartment_params.merge(user_id: @current_user.id))

    if @apartment.save
      if @apartment.rental
        @rental = Rental.create(rental_params.merge(apartment_id: @apartment.id))
      else
        Market.create(market_params.merge(apartment_id: @apartment.id))
      end

      @user_apartment = UserApartment.create(user_id: @current_user.id, apartment_id: @apartment.id) if @apartment.favourite
      render json: ApartmentRepresenter.new(@apartment).as_json, status: :created
    else
      render json: {
        message: 'Apartment not listed',
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
        if UserApartment.where(user_id: @current_user.id, apartment_id: @apartment.id).empty?
          @user_apartment = UserApartment.create(user_id: @current_user.id, apartment_id: @apartment.id)
        else
          render json: { message: 'Apartment already added to favourites' }, status: :unprocessable_entity
        end
      else
        @user_apartment = UserApartment.where(user_id: @current_user.id, apartment_id: @apartment.id).first
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
    params.require(:rental).permit(:price, :period)
  end

  def market_params
    params.require(:market).permit(:price)
  end
end

# rubocop:enable Style/GuardClause