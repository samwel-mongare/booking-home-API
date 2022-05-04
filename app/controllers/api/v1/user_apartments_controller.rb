class Api::V1::UserApartmentsController < ApplicationController
  include CurrentUserConcern
  def index
    @user_apartments = @current_user.apartments
    render json: ApartmentsRepresenter.new(@user_apartments).as_json
  end
end
