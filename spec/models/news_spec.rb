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
require 'rails_helper'

RSpec.describe News, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
