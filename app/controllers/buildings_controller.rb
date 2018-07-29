class BuildingsController < ApplicationController
  # t.string :name
  # t.string :country
  # t.string :address
  # t.integer :rent_per_floor
  # t.integer :number_of_floors

  before_action :set_building, only: [:edit, :update, :show]

  def edit
  end

  def update
    if @building.update(building_params)
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  def index
    @buildings = Building.all
  end

  def show
  end

  private

    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end

end
