class Employee < ApplicationRecord
  # t.string :name
  # t.string :title
  # t.integer :company_id

  belongs_to :company

  validates :name, presence: true
  validates :title, presence: true
  validates :company_id, presence: true


end
