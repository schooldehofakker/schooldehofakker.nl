require 'contentful'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.schooldehofakker.nl'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  # add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add contact_path
  add kracht_van_de_hofakker_path
  add leraren_path
  add vacatures_path, priority: 0.7, changefreq: 'daily'

  @content ||= Contentful::Client.new(
    access_token: Rails.application.credentials.contentful[:access_token],
    space: Rails.application.credentials.contentful[:space],
    default_locale: 'nl-NL',
    dynamic_entries: :auto,
    raise_errors: true
  )

  nieuws = @content.entries(content_type: 'nieuws', order: '-fields.published')
  nieuws.each do |n|
    add nieuw_path(n.slug), priority: 0.75, changefreq: 'daily', lastmod: n.published
  end
end
