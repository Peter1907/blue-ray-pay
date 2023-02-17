class Invoice < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  has_and_belongs_to_many :categories, join_table: :records

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
