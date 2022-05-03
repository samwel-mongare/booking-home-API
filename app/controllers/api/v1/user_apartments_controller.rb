class Api::V1::UserApartmentsController < ApplicationController
  include CurrentUserConcern
  def index
    @current_user = User.find(params[:user_id])
    @user_apartments = @current_user.apartments.all

    puts @current_user, 'Current User'
    render json: ApartmentsRepresenter.new(@user_apartments).as_json
  end
end
