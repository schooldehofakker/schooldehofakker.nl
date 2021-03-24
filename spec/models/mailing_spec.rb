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
require 'rails_helper'

RSpec.describe Mailing, type: :model do
  describe 'it responds to' do
    it {
      expect(subject).to respond_to :description, :mailing_send, :published_at, :send_at, :sender,
                                    :slug, :title
    }
  end

  it { is_expected.to have_db_column(:description).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:published_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:send_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:sender).of_type(:string) }
  it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }

  describe 'validations' do
    subject { build(:mailing) }

    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :title }
  end
end
