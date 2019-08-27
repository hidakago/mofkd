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
      redirect_to rentals_path, notice:"物件情報を登録しました！"
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
      redirect_to rentals_path, notice:"物件情報を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @nearest_stations = NearestStation.where(rental_id: @rental.id)
    @nearest_stations.each do |n|
      n.destroy
    end
    @rental.destroy
    redirect_to rentals_path, notice:"物件情報を削除しました！"
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
