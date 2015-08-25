ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('./lib/question')
require('./lib/option')
require('./lib/survey')
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
  end
end
