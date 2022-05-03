class Api::V1::UserApartmentsController < ApplicationController
  def index
    @user_favourite = UserApartment.where(user_id: current_user.id)
    @user_apartments = Apartment.where(id: @user_favourite.map(&:apartment_id))
    render json: ApartmentsRepresenter.new(@user_apartments).as_json
  end
end
