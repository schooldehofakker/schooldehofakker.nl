# index page
class NieuwsbrievenController < ApplicationController
  def index
    @allnewsletters = cache_data(key: 'nieuwsbrieven', time: 1.hour) do
      @content.entries(content_type: 'nieuwsbrieven', order: '-fields.published')
    end
  end

  def show
    @newsletter = @content.entries(content_type: 'nieuwsbrieven', 'fields.slug[in]' => params[:slug]).first
    @othernewsletters = @content.entries(content_type: 'nieuwsbrieven', order: '-fields.published', 'fields.slug[ne]' => params[:slug])
  end
end
