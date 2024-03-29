# frozen_string_literal: true

require 'contentful'

# ApplicationController
class ApplicationController < ActionController::Base
  before_action :check_contentful_client
  before_action :check_agenda
  before_action :create_richtext_renderer

  def current_user
    @current_user ||= super || Guest.new
  end

  # Allow for caching so we don't push our free plan on the contentful
  # api to the max
  def cache_data(key, time = 2.days, &block)
    Rails.cache.fetch(key, expires_in: time, &block)
  rescue StandardError
    yield
  end

  def user_signed_in?
    current_user.is_a? User
  end

  private

  # cache agenda items
  def check_agenda
    @agenda ||= cache_data(key: 'nieuws', time: 1.day) do
      @content.entries(content_type: 'agenda', order: 'fields.from', limit: 5,
                       'fields.from[gte]' => Time.zone.now.strftime('%Y-%m-%d'))
    end
  end

  # Creates a Contentful Client Instance
  def check_contentful_client
    @content ||= Contentful::Client.new(
      access_token: Rails.application.credentials.contentful[:access_token],
      space: Rails.application.credentials.contentful[:space],
      default_locale: 'nl-NL',
      dynamic_entries: :auto,
      raise_errors: true
    )
  end

  def create_richtext_renderer
    @renderer ||= RichTextRenderer::Renderer.new
  end
end

# Create null object for Guest user
class Guest
  def admin?
    false
  end
end
