class Api::V1::MarketsController < ApplicationController
  include CurrentUserConcern

  def index
    @markets = Apartment.where(rental: false)
    render json: ApartmentsRepresenter.new(@markets).as_json
  end
end
