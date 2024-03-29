# frozen_string_literal: true

# == Schema Information
#
# Table name: mailings
#
#  id           :bigint           not null, primary key
#  description  :string           not null
#  published_at :datetime
#  send_at      :datetime
#  sender       :string
#  slug         :string           not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_mailings_on_slug   (slug) UNIQUE
#  index_mailings_on_title  (title) UNIQUE
#
class Mailing < ApplicationRecord
  has_one_attached :attachment
  has_rich_text :content

  self.implicit_order_column = :published_at

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :content, presence: true
  validates :description, presence: true
  validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  def mailing_send
    !send_at.nil?
  end
end
