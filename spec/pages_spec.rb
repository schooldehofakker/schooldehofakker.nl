# frozen_string_literal: true
# require 'spec_helper'

# # Array of all generated pages
# site = File.join(File.dirname(__FILE__), '..', '_site', '**', '*.html')
# PAGES = Dir.glob(site).map{ |p| p.gsub(/[^_]+\/_site(.*)/, '\\1') }

# PAGES.each do |p|
#   describe p do
#     it_behaves_like 'Page'

#     before :each do
#       visit p
#     end

#     it 'has only valid internal hyperlinks' do
#       page.all(:css, 'a').each do |link|
#         next if link.text == '' || link[:href].match(/(http|\/\/).*/)
#         page.find(:xpath, link.path).click
#         expect(page.status_code).to be(200), "expected link '#{link.text}' to work"
#         visit p
#       end
#     end
#   end
# end
