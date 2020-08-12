class Restaurant < ApplicationRecord
  before_validation :capitalize_category

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: ['Chinese', 'Italian', 'Japanese', 'French', 'Belgian'] }

  def capitalize_category
    category.try(:capitalize!)
  end
end
