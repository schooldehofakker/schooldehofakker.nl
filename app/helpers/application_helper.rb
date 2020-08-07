module ApplicationHelper
  # helper to check whether selected page must change style to
  # accentuate being selected
  def active_class(link_path)
    current_page?(link_path) ? 'item--current' : ''
  end

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
