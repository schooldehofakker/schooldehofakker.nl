module Seeds
  module Administrator
    def self.included(_modul)
      _modul.do_seed
    end

    class << self
      attr_accessor :user
    end

    class_eval do
      def do_seed
        Seeds::Administrator.user = seed_user
      end

      def seed_user
        user = User.find_or_create_by!(email: 'blijblijblij@hey.com') do |newuser|
          newuser.first_name = 'Rogier'
          newuser.last_name = 'Wessel'
          newuser.admin = true
          newuser.uuid = SecureRandom.uuid
          newuser.password = Rails.application.credentials.bootstrap[:password]
          newuser.password_confirmation = Rails.application.credentials.bootstrap[:password]
        end
        user.update! first_name: 'Rogier', last_name: 'Wessel', admin: true
        user.password = Rails.application.credentials.bootstrap[:password]
        user.password_confirmation = Rails.application.credentials.bootstrap[:password]
        user.save!
        user
      end
    end
  end
end
