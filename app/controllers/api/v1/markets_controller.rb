class Api::V1::MarketsController < ApplicationController
  include CurrentUserConcern
  # before_action :authenticate_user!

  def index
    @markets = Apartment.where(rental: false)
    render json: ApartmentsRepresenter.new(@markets).as_json
  end
end
