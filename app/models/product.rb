class Product < ApplicationRecord
  extend Enumerize
  after_create :send_notify_after_creating
  mount_uploader :image, ImageUploader

  enumerize :level, in: [:easy, :medium, :hard], default: :easy
  enumerize :country, in: ISO3166::Country.translations, default: :VN

  belongs_to :category, optional: true

  before_save :strip_html_from_description, :set_lower_title

  scope :published, -> { where(published: true) }
  scope :priced_more_than, ->(price) { where('price > ?', price) }
  scope :priced_more_than_index, ->(price) { where('price > ?', price).select(:price, :index) }

  validates :title, :description, presence: true
  validates :price, numericality:{ greater_than: 0 }
  validate :title_is_shorter_than_description

  def send_notify_after_creating
    ProductMailer.send_notify_after_creating_product(self).deliver_now
  end

  def title_is_shorter_than_description
    return if title.blank? || description.blank?
    if description.length  < title.length
      errors.add(:description, 'can\'t be shorter than title')
    end
  end

  def strip_html_from_description
    self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
  end

  def set_lower_title
    self.title.downcase!
  end
end
