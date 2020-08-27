module Seeds
  module NewsItems
    def self.included(_modul)
      _modul.do_seed
    end

    class_eval do
      def do_seed
        # seed all except development and staging, nothing else
        return unless Rails.env.development? || Rails.env.staging?

        require 'faker'
        News.destroy_all
        25.times do |_row|
          title = Faker::Lorem.sentence
          slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

          p News.create!(
            title: title,
            content: "<p>#{Faker::Lorem.paragraph(sentence_count: 10, supplemental: true, random_sentences_to_add: 10)}</p><center><img src='https://lorempixel.com/g/500/300/nature/' ><p>#{Faker::Lorem.paragraph(sentence_count: 5, supplemental: false, random_sentences_to_add: 14)}</p>",
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
