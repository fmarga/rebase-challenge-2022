require 'sidekiq'
require 'csv'
require './setup_database'

class DataWorker
  include Sidekiq::Worker

  def import(data)
    csv = CSV.parse(data, col_sep: ';', headers: true)
    SetupDatabase.new.drop_table
    SetupDatabase.table
    SetupDatabase.insert(csv)
  end
end