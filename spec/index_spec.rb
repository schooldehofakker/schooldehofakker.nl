# frozen_string_literal: true

require 'spec_helper'

describe 'Title page' do
  before :each do
    visit '/index.html'
  end

  it 'has a correct title' do
    expect(page).to have_title('Over de school')
  end

  it 'has a correct headline' do
    expect(page).to have_css('h1', text: 'Over de school')
  end

  # it 'has front navigation' do
  #   expect(page).to have_css('class="nav  nav--header', count: 4)
  # end

  # Currently not implemented
  # it "has featured blog posts" do
  #  expect(page).to have_css("div#blog-features article", count: 2)
  # end

  # it 'has blog headlines' do
  #   expect(page).to have_css('div#blog-headlines article', count: 4)
  # end
end
