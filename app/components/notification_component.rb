class NotificationComponent < ViewComponent::Base
  def initialize(type:, data:)
    @type = type
    @data = data
  end
end
