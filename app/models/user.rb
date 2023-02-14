class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :invoices, dependent: :destroy

  validates :name, presence: true
end
