require 'sidekiq'
require './setup_database'

class DataJob
  include Sidekiq::Job

  def import(file_path)
    file = open(file_path, 'r')
    SetupDatabase.new.table
    SetupDatabase.insert
    File.delete(file_path)
  end
end