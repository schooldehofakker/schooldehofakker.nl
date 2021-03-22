# frozen_string_literal: true

# index page
class VacaturesController < ApplicationController
  def index
    @vacatures = cache_data(key: 'vacatures', time: 1.hour) do
      @content.entries(content_type: 'vacatures', include: 2)
    end
  end
end
