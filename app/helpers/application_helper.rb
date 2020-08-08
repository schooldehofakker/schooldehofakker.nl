module ApplicationHelper
  # helper to check whether selected page must change style to
  # accentuate being selected
  def active_class(link_path)
    current_page?(link_path) ? 'item--current' : ''
  end
end
