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

get('/surveys/:id/edit') do
  id = params.fetch("id").to_i
  @survey = Survey.find(id)
  erb(:survey_edit)
end

post('/surveys') do
  survey_name = params.fetch 'survey_name'
  Survey.create({name: survey_name})
  @surveys = Survey.all
  erb :surveys
end

delete ('/surveys/:id') do
  id = params.fetch('id').to_i
  survey = Survey.find(id)
  survey.destroy
  @surveys = Survey.all

  erb(:surveys)
end

get ('/surveys/:id') do
  id = params.fetch("id").to_i
  @survey = Survey.find(id)
  @questions = @survey.questions
  erb(:survey_detail)
end

delete ('/questions/:id') do
  id = params.fetch('id').to_i
  question = Question.find(id)
  question.destroy
  survey_id = params.fetch("survey_id").to_i
  @survey = Survey.find(survey_id)
  @questions = @survey.questions
  erb(:survey_detail)
end

patch('/surveys/:id') do
  id = params.fetch('id').to_i
  @survey = Survey.find(id)
  survey_name = params.fetch 'survey_name'
  @survey.update({name: survey_name})
  @questions = @survey.questions
  erb :survey_detail
end

post ('/questions') do
  name = params.fetch "question_name"
  survey_id = params.fetch("survey_id").to_i
  Question.create({name: name, survey_id: survey_id})
  @survey = Survey.find(survey_id)
  @questions = @survey.questions
  erb :survey_detail
end
