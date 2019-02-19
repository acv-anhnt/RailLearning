class Product < ApplicationRecord
  scope :published, -> { where(published: true) }
  scope :priced_more_than, ->(price) { where('price > ?', price) }
  scope :priced_more_than_index, -> (price) { where('price > ?', price).select(:price, :index) }
  validates :title, :description, presence: true
  validates :price, numericality:{ greater_than: 0 }
  validate :title_is_shorter_than_description

  def title_is_shorter_than_description
    return if title.blank? || description.blank?
    if description.length  < title.length
      errors.add(:description, 'can\'t be shorter than title')
    end
  end
end
