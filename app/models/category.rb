class Category < ApplicationRecord
  include ImageUploader::Attachment(:icon)

  belongs_to :user
  has_many :records, dependent: :destroy
  has_and_belongs_to_many :invoices, join_table: :records

  validates :name, presence: true
  validates :icon_data, presence: true
end
