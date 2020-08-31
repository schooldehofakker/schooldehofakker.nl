Pathname.glob(Rails.root.join('db', 'seeds', '*.rb')).each { |path| require path.to_s }
include Seeds::Administrator
include Seeds::NewsItems
