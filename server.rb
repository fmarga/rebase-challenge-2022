require 'sinatra'
require 'rack/handler/puma'
require 'pg'
require './medical_record'

get '/' do
  'Hello World -----
  /tests => json imported from csv file -----
  /import => soon -----'
end

get '/tests' do
  conn = PG.connect(host: 'postgres', user: 'postgres', password: 'pass')

  results = conn.exec('SELECT * FROM records')

  columns = results.fields

  results.map do |result|
    result.each_with_object({}).with_index do |(cell, acc), idx|
      column = columns[idx]
      acc[column] = cell[1]
    end
  end.to_json
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)
