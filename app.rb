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

get('/questions/:id/edit') do
  id = params.fetch("id").to_i
  @question = Question.find(id)
  erb(:question_edit)
end

get('/surveys/:id/edit') do
  id = params.fetch("id").to_i
  @survey = Survey.find(id)
  @ref = params.fetch('ref')
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

patch('/questions/:id') do
  id = params.fetch('id').to_i
  @question = Question.find(id)
  question_name = params.fetch "question_name"
  @question.update({name: question_name})
  @options = @question.options
  erb(:question_detail)
end


patch('/surveys/:id') do
  ref = params.fetch('ref')
  id = params.fetch('id').to_i
  @survey = Survey.find(id)
  survey_name = params.fetch 'survey_name'
  @survey.update({name: survey_name})
  @questions = @survey.questions
  @surveys = Survey.all
  if ref == "detail"
    erb :survey_detail
  elsif ref == "surveys"
    erb :surveys
  else
    erb :surveys
  end
end

post('/questions') do
  name = params.fetch "question_name"
  survey_id = params.fetch("survey_id").to_i
  Question.create({name: name, survey_id: survey_id})
  @survey = Survey.find(survey_id)
  @questions = @survey.questions
  erb :survey_detail
end

get('/questions/:id') do
  id = params.fetch('id').to_i
  # question_id = params.fetch('question_id').to_i
  @question = Question.find(id)
  @options = @question.options
  erb(:question_detail)
end

post('/options') do
  name = params.fetch 'option_name'
  question_id = params.fetch('question_id').to_i
  Option.create({name: name, question_id: question_id})
  @question = Question.find(question_id)
  @options = @question.options
  erb(:question_detail)
end

patch('/options/:id') do
  id = params.fetch('id').to_i
  @option = Option.find(id)
  option_name = params.fetch 'option_name'
  @option.update ({name: option_name})
  @question = @option.question
  @options = @question.options
  @option = Option.all
  erb(:question_detail)
end

get('/options/:id/edit') do
  id = params.fetch('id').to_i
  @option = Option.find(id)
  erb(:option_edit)
end

get('/questions/:id/responses/new') do

  id = params.fetch('id').to_i
  @question = Question.find(id)
  erb :response_new
end

post('/responses') do
  option_id = params.fetch('option').to_i
  question_id = params.fetch('question_id').to_i
  question = Question.find(question_id)
  survey = question.survey
  response = Response.create({question_id: question_id, option_id: option_id})
  erb :response_new
end

delete('/options/:id') do
  id = params.fetch('id').to_i
  option = Option.find(id)
  @question = option.question
  option.destroy
  @options = @question.options
  erb(:question_detail)
end
