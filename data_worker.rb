require 'sidekiq'
require './setup_database'

class DataWorker
  include Sidekiq::Worker

  def import(file_path)
    file = open(file_path, 'r')
    SetupDatabase.new.table
    SetupDatabase.insert(file)
    File.delete(file_path)
  end
end