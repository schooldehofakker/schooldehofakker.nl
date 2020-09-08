# app/controllers/feeds_controller.rb
class FeedsController < ApplicationController

  layout false

  def rss
    @news = @content.entries(content_type: 'nieuws', order: '-fields.published', limit: 15)
  end
end
