class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= super || Guest.new
  end

  def user_signed_in?
    current_user.is_a? User
  end
end

# Create null object for Guest user
class Guest
  def admin?
    false
  end
end
