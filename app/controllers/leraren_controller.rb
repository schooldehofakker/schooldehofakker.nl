# index page
class LerarenController < ApplicationController
  def index
    @leraren = cache_data(key: 'leraren') do
      @content.entries(content_type: 'leraren', order: 'fields.voornaam', include: 2)
    end
  end
end
