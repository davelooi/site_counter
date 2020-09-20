require 'sinatra/base'
require './config/mongoid'
require './app/models/counter'

class SiteCounter < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  get '/counter/:key' do
    counter = Counter.find_or_create_by(key: params[:key])
    counter.increment!
    counter.counter.to_s
  end
end
