# frozen_string_literal: true

# app/helpers/meta_tags_helper.rb
module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META['meta_title']
  end

  def meta_description
    # rubocop:disable Layout/LineLength
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META['meta_description']
    # rubocop:enable Layout/LineLength
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META['meta_image'])
    meta_image.starts_with?('http') ? meta_image : image_url(meta_image)
  end
end
