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
  Result.select_tests
end

get '/tests/:token' do
  token = params[:token]
  Result.find_token(token)
end

post '/import' do
  begin
    path = "import/#{File.basename(request.body.to_path)}"
    DataWorker.perform_async(path)
    201
  rescue
    500
  end
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)
