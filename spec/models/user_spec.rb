# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it {
    expect(subject).to respond_to :admin, :email, :encrypted_password,
                                  :first_name, :last_name, :remember_created_at, :reset_password_sent_at,
                                  :reset_password_token
  }

  it {
    is_expected.to have_db_column(:admin).of_type(:boolean).with_options(null: false)
    is_expected.to have_db_column(:email).of_type(:string).with_options(null: false)
    is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false)
    is_expected.to have_db_column(:first_name).of_type(:string)
    is_expected.to have_db_column(:last_name).of_type(:string)
    is_expected.to have_db_column(:remember_created_at).of_type(:datetime)
    is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime)
    is_expected.to have_db_column(:reset_password_token).of_type(:string)
  }
end
