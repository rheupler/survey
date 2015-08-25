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
