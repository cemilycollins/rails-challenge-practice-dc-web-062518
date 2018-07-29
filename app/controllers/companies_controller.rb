class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update, :show]

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def index
    @companys = Company.all
  end

  def show
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end

end
