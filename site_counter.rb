require 'dotenv/load'
require 'sinatra/base'
require 'sinatra/cross_origin'
require './config/mongoid'
require './app/models/counter'

class SiteCounter < Sinatra::Base
  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

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
