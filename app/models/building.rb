require 'pry'

class Building < ApplicationRecord
  # t.string :name
  # t.string :country
  # t.string :address
  # t.integer :rent_per_floor
  # t.integer :number_of_floors

  has_many :offices
  has_many :companies, through: :offices

  validates :name, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :rent_per_floor, presence: true
  validates :number_of_floors, presence: true

  def available_floors_array
    b = self.offices.map do |office|
      office.floor
    end
    a = Array(1..self.number_of_floors).select do |floor_number|
      b.include?(floor_number) == false
    end
    a
  end

  def total_revenue
    self.offices.length * self.rent_per_floor
  end
end
