# app/controllers/feeds_controller.rb
class FeedsController < ApplicationController
  layout false
  def rss
    @allnews = cache_data(key: 'nieuws', time: 1.hour) do
      @content.entries(content_type: 'nieuws', order: '-fields.published')
    end
  end
end
