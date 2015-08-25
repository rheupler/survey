require 'sinatra/activerecord'
require 'sinatra/reloader'
require './lib/option'
require './lib/question'
require './lib/response'
require './lib/survey'
require 'sinatra'
require 'pry'

get('/') do
  erb(:index)
end

get('/surveys') do
  @surveys = Survey.all
  erb(:surveys)
end

get('/surveys/new') do
  erb(:surveys_new)
end

post('/surveys') do
  survey_name = params.fetch 'survey_name'
  Survey.create({name: survey_name})
  @surveys = Survey.all
  erb :surveys
end
