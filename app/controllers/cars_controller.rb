class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  include RecipientsFor::MessageServices
  include RecipientsFor::ReaderServices

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    #all_messageble_messages(@car)
    @messages = @car.all_messages
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:brand, :model)
    end
end
