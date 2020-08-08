# == Schema Information
#
# Table name: news
#
#  id           :bigint           not null, primary key
#  published_at :datetime
#  slug         :string
#  status       :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_news_on_slug  (slug) UNIQUE
#
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
