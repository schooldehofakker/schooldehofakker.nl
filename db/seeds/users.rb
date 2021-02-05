module Seeds
  module Users
    def self.included(_modul)
      _modul.do_seed
    end

    class_eval do
      def do_seed
        # seed development and staging, nothing else
        return unless Rails.env.development? || Rails.env.staging?

        User.where(admin: false).destroy_all
        require 'faker'
        25.times do |_row|
          last_name = Faker::Name.last_name
          password_length = 32
          password = Devise.friendly_token.first(password_length)

          p User.create!(
            first_name: Faker::Name.first_name,
            last_name: last_name,
            email: "rhwessel+#{last_name}#{rand(0..9999)}@gmail.com",
            uuid: SecureRandom.uuid,
            created_at: Time.now,
            updated_at: Time.now,
            password: password,
            password_confirmation: password
          )
        end
      end
    end
  end
end
