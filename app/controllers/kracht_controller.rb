# index page
class KrachtController < ApplicationController
  def index
    @kracht = cache_data(key: 'kracht-van-de-hofakker') do
      @content.entries(content_type: 'pagina', 'fields.slug[in]' => 'kracht-van-de-hofakker').first
    end
  end
end
