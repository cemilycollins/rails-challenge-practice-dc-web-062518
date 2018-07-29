class Company < ApplicationRecord
  # t.string :name

  has_many :employees
  has_many :offices
  has_many :buildings, through: :offices

  accepts_nested_attributes_for :buildings

  validates :name, presence: true

end
