require 'aws-sdk-s3'
require 'contentful'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.schooldehofakker.nl'

region = Rails.application.credentials.aws[:region]
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(Rails.application.credentials.aws[:bucket],
                                                                        aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
                                                                        aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
                                                                        aws_region: region)
# The remote host where your sitemaps will be hosted
SitemapGenerator::Sitemap.sitemaps_host = "https://hofakker-#{Rails.env}.s3-#{region}.amazonaws.com"

# The directory to write sitemaps to locally
SitemapGenerator::Sitemap.public_path = 'tmp/sitemap'

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

  @content.entries(content_type: 'nieuws', order: '-fields.published').each do |n|
    add nieuw_path(n.slug), priority: 0.75, changefreq: 'daily', lastmod: n.published
  end
end
