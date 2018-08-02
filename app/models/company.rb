require 'pry'

class Company < ApplicationRecord
  # t.string :name

  has_many :employees
  has_many :offices
  has_many :buildings, through: :offices

  accepts_nested_attributes_for :offices, :employees
  validates :name, presence: true

  def offices_attributes=(office_hash)
    office_hash.each do |key, value|
      office = value
      new_office = self.offices.build(building_id: office[:building_id], floor: office[:floor].last(2).to_i, company_id: self.id)
      new_office.save
    end
  end

  def total_rent
    total = 0
    self.offices.each do |office|
      total += office.building.rent_per_floor
    end
    total
  end
end
