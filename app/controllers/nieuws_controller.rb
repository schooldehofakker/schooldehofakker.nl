# index page
class NieuwsController < ApplicationController
  def index; end

  def show
    @news = @content.entries(content_type: 'nieuws', 'fields.slug[in]' => params[:id]).first
    @othernews = @content.entries(content_type: 'nieuws', order: '-fields.published', 'fields.slug[ne]' => params[:id])
  end
end
