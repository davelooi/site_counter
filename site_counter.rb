require 'dotenv/load'
require 'sinatra/base'
require "sinatra/cors"
require './config/mongoid'
require './app/models/counter'

class SiteCounter < Sinatra::Base
  register Sinatra::Cors
  set :allow_origin, "*"
  set :views, settings.root + '/app/views'

  get '/' do
    erb :hello
  end

  get '/counter/:key' do
    counter = Counter.find_or_create_by(key: params[:key])
    counter.increment!
    counter.counter.to_s
  end
end
