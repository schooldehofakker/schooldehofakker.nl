# index page
class IndexController < ApplicationController
  def index
    @index = cache_data(key: 'over-de-school') do
      @content.entries(content_type: 'pagina', 'fields.slug[in]' => 'over-de-school').first
    end
  end
end
