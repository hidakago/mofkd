class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    2.times { @rental.nearest_stations.build }
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      redirect_to rentals_path
    else
      render :edit
    end
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:name, :rent, :address, :age, :note,
     nearest_stations_attributes: [:route_name, :station_name, :walking_time])
  end
end
