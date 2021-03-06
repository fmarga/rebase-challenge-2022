require 'sinatra'
require 'rack/handler/puma'
require 'pg'
require './data_worker'
require './setup_database'
require './result'

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

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)
