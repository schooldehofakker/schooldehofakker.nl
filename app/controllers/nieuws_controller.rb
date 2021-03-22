# frozen_string_literal: true

# index page
class NieuwsController < ApplicationController
  def index
    @allnews = cache_data(key: 'nieuws', time: 1.hour) do
      @content.entries(content_type: 'nieuws', order: '-fields.published')
    end
  end

  def show
    @news = @content.entries(content_type: 'nieuws', 'fields.slug[in]' => params[:id]).first
    @othernews = @content.entries(content_type: 'nieuws', order: '-fields.published',
                                  'fields.slug[ne]' => params[:id])
  end
end
