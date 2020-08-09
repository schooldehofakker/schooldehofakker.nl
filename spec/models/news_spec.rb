# == Schema Information
#
# Table name: news
#
#  id           :bigint           not null, primary key
#  published_at :datetime         not null
#  slug         :string           not null
#  status       :string           not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_news_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe News, type: :model do
  it {
    expect(subject).to respond_to :content,
                                  :slug,
                                  :status,
                                  :title,
                                  :published_at
  }

  it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:status).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:published_at).of_type(:datetime).with_options(null: false) }

  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :slug }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :status }
  it { is_expected.to validate_presence_of :published_at }

  it { should validate_length_of(:title).is_at_least(5) }
end
