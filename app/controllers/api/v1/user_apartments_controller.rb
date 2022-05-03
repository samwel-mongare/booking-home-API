class Api::V1::UserApartmentsController < ApplicationController
  def index
    @user_apartments = Apartment.where(id: params[:apartment_id])
    render json: ApartmentsRepresenter.new(@user_apartments).as_json
  end
end
