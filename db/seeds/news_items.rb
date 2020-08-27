require 'faker'

module Seeds
  module NewsItems
    def self.included(_modul)
      _modul.do_seed
    end

    class_eval do
      def do_seed
        # seed all except development and staging, nothing else 
        return unless Rails.env.development? || Rails.env.staging?

        News.destroy_all
        10.times do |_row|
          title = Faker::Lorem.sentence
          slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

          p News.create!(
            title: title,
            content: "<p>#{Faker::Lorem.paragraph}</p><center><img src='#{Faker::LoremPixel.image(size: '500x150', is_gray: [true, false].sample, category: ['abstract', 'nature', 'people', 'technics'].sample)}' alt='#{Faker::Lorem.sentence}'></center><p>#{Faker::Lorem.paragraph}</p>",
            status: ['published', 'deleted', 'unpublished'].sample,
            created_at: Time.now,
            published_at: Time.now,
            updated_at: Time.now,
            slug: slug
          )
        end
      end
    end
  end
end
