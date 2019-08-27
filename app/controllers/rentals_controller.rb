class RentalsController < ApplicationController

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    2.times { @rental.nearest_stations.build }
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.invalid?
      render :new
    else
      if @rental.save
        redirect_to rentals_path
      else
        render :new
      end
    end
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  private

  def rental_params
    # params = { rental: {
    #        name: 'jack',
    #        rent: 999,
    #        address: 'tokyo',
    #        age: 2,
    #        note: 'nnnnnnnnnn',
    #        nearest_stations_attributes: [
    #          {route_name: '山手線', station_name: '渋谷駅', walking_time: 10 },
    #          {route_name: '中央線', station_name: '東小金井駅', walking_time: 15 },
    #        ]
    #  }}
    # params.require(:picture).permit(:comment, :image, :user_id, :image_cache)
    params.require(:rental).permit(:name, :rent, :address, :age, :note,
     nearest_stations_attributes: [:route_name, :station_name, :walking_time])
  end

end
