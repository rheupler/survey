require 'spec_helper'
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', type: :feature) do
  it 'displays the index page' do
    visit '/'
    expect(page).to have_content 'Survey Nexus'
  end
end

describe("/surveys", type: :feature) do
  it 'displays the current surveys' do
    visit '/'
    click_link "Take a survey"
    expect(page).to have_content("Here are the current surveys")
  end
end
