ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('./lib/question')
require('./lib/option')
require('./lib/survey')
require('./lib/response')
require('./app')

RSpec.configure do |config|
  config.after(:each) do
    Question.all() do |question|
      question.destroy()
    end
    Option.all() do |option|
      option.destroy()
    end
    Survey.all() do |survey|
      survey.destroy()
    end
    Response.all() do |response|
      response.destroy()
    end
  end
end
