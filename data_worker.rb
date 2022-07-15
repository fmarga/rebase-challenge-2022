require 'sidekiq'
require 'base64'

class DataWorker
  include Sidekiq::Worker

  def import(file_path)
    file = open(file_path, 'r')
    SetupDatabase.new(file).from_csv
    File.delete(file_path)
  end
end