require 'dotenv/load'
require 'sinatra/base'
require './config/mongoid'
require './app/models/counter'

class SiteCounter < Sinatra::Base
  set :views, settings.root + '/app/views'

  get '/' do
    erb :hello
  end

  get '/counter/:key' do
    headers(
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Allow-Methods' => ['GET']
    )
    counter = Counter.find_or_create_by(key: params[:key])
    counter.increment!
    counter.counter.to_s
  end
end
