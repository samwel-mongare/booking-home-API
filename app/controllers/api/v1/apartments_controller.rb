class Api::V1::ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
    render json: ApartmentsRepresenter.new(@apartments).as_json
  end
end
