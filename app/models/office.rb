class Office < ApplicationRecord
  # t.integer :building_id
  # t.integer :company_id
  # t.integer :floor

  # an office takes up an entire floor

  belongs_to :building
  belongs_to :company
  has_many :employees, through: :companies

  validates :building_id, presence: true
  validates :floor, presence: true, uniqueness: true, numericality: true
end
