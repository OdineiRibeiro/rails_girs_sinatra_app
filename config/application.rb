configure :production, :development do
  require 'json'
  require 'httpclient'
  require 'colorize'
  require 'httpclient'
  require 'json'
  require './helpers/firebase_api.rb'
  require './lib/sing.rb'
end

configure :development do
  require 'pry'
  require 'dotenv'
  Dotenv.load
end
