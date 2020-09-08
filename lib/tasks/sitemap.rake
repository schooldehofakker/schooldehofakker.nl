# lib/rake/sitemap.rake

task :generate_sitemap do
  Rake::Task['sitemap:refresh'].invoke
end
