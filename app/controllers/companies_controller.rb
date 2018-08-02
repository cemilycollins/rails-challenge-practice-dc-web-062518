class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update, :show]

  def new
    @company = Company.new
    @company.offices.build(company_id: @company.id)
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      @company.offices.each do |office|
        office.update(company_id: @company.id)
      end
      redirect_to company_path(@company)
    else
      render :new
    end
  end

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
    @companies = Company.all
  end

  def show
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name,
        offices_attributes: [
          :building_id,
          :floor,
          :company_id
        ],
        employees_attributes: [
          :name,
          :title,
          :office_id,
          :company_id
        ])
    end

end
