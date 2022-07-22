require 'sinatra'
require 'sinatra/base'
require 'rack/handler/puma'
require 'pg'
require './data_worker'
require './setup_database'
require './result'

class Application < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, 3000

  get '/' do
    'Hello World'
  end

  get '/tests' do
    Result.select_tests.to_json
  end

  get '/tests/:token' do
    token = params[:token]
    Result.find_token(token).to_json
  end

  post '/import' do
    begin
      DataWorker.perform_async(request.body.read)
      201
    rescue
      404
    end
  end

  run! if app_file == $0
end
