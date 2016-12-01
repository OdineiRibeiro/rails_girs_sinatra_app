require 'sinatra'
require 'yaml/store'
require 'pry'
require 'httpclient'
require 'json'
require './helpers/firebase_api.rb'
require 'dotenv'
Dotenv.load

Choices = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'CUR' => 'Curry',
  'NOO' => 'Noodles'
}.freeze

# Source: http://guides.railsgirls.com/sinatra-app

get '/' do
  @title = 'Bem vindo ao Suffragist!'

  erb :index
end

post '/cast' do
  @title = 'Obrigado pelo seu voto!'
  @vote  = params['vote']

  response = FirebaseApi.get('votes.json')
  body = JSON.parse(response.body)
  body[params['vote']] = body[params['vote']] + 1
  FirebaseApi.put('votes.json', body)

  erb :cast
end

get '/results' do
  @title = 'Results so far:'
  response = FirebaseApi.get('votes.json')
  body = JSON.parse(response.body)
  @votes = body

  erb :results
end
