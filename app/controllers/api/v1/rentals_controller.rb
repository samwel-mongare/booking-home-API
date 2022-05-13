class Api::V1::RentalsController < ApplicationController
  include CurrentUserConcern
  # before_action :authenticate_user!

  def index
    @rentals = Apartment.where(rental: true)
    render json: ApartmentsRepresenter.new(@rentals).as_json
  end
end
