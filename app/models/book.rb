class Book < ApplicationRecord
  has_one_attached :file, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  validates :description, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 25}
end
