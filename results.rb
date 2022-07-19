require 'pg'
require 'csv'
require './data_connection'
require './setup_database'

class Results
  def self.select_tests
    results = SetupDatabase.select_table

    columns = results.fields

    results.map do |result|
      result.each_with_object({}).with_index do |(cell, acc), idx|
        column = columns[idx]
        acc[column] = cell[1]
      end
    end.to_json
  end
end