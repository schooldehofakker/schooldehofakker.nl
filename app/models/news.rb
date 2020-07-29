class News < ApplicationRecord
  self.implicit_order_column = :created_at

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content

  enum status: { published: 'published', unpublished: 'unpublished', deleted: 'deleted ' }, _scopes: false

  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true
  validates :status, presence: true
  validates :published_at, presence: true

  STATUS = News.statuses.map { |k, v| [k.humanize, v] }
end
