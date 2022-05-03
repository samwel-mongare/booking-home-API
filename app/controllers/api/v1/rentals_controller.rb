class Api::V1::RentalsController < ApplicationController
  def index
    @rentals = Apartment.where(rental: true)
    render json: ApartmentsRepresenter.new(@rentals).as_json
  end
end
