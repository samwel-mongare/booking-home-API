# rubocop:disable Style/GuardClause

class Api::V1::ApartmentsController < ApplicationController
  include CurrentUserConcern
  # before_action :authenticate_user!

  def index
    @apartments = Apartment.all
    render json: ApartmentsRepresenter.new(@apartments).as_json
  end

  def show
    @apartment = Apartment.find(params[:id])
    render json: ApartmentRepresenter.new(@apartment).as_json
  end

  def create
    @apartment = Apartment.create(apartment_params)

    if @apartment.save
      if @apartment.rental
        @rental = Rental.create(price: @apartment.rental_price, apartment_id: @apartment.id, period: @apartment.period)
      else
        Market.create(price: @apartment.house_price, apartment_id: @apartment.id)
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
    @current_user = User.find(apartment_params[:user_id])
    @apartment = Apartment.find(params[:id])
    @apartment.update(favourite: apartment_params[:favourite])
    if @apartment.save
      if @apartment.favourite
        if UserApartment.where(user_id: @current_user.id, apartment_id: @apartment.id ).empty?
          @user_apartment = UserApartment.create(user_id:  @current_user.id, apartment_id: @apartment.id)
        else
          render json: { message: 'Apartment already added to favourites' }, status: :unprocessable_entity
        end
      else
        @user_apartment = UserApartment.where(user_id:  @current_user.id, apartment_id: @apartment.id).first
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
    params.require(:apartment).permit(:name, :description, :location, :rental, :image1, :image2,
                                      :image3, :favourite, :rental_price, :house_price, :period, :user_id, :apartment_id)
  end
end

# rubocop:enable Style/GuardClause
