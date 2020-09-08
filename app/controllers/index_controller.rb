# index page
class IndexController < ApplicationController
  def index
    @index = @content.entries(content_type: 'pagina', 'fields.slug[in]' => 'over-de-school').first
  end
end
