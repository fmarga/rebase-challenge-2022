require 'sidekiq'
require './setup_database'

class DataWorker
  include Sidekiq::Worker

  def import(file)
    csv = CSV.read(file, col_sep: ';', headers: true)
    SetupDatabase.new.table
    SetupDatabase.insert(csv)
    File.delete(file)
  end
end