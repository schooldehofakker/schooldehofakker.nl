# lib/rake/sitemap.rake
require 'time'

task :generate_sitemap do
  Rake::Task['sitemap:refresh'].invoke # if Time.now.tuesday?
end
