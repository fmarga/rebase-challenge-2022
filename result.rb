require 'pg'
require 'csv'
require './data_connection'
require './setup_database'

class Result

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

  def self.find_token(token)
    conn = SetDataConnection.connect
    results = conn.exec_params("SELECT * FROM records WHERE token_resultado_exame = '#{token}'")
    columns = results.fields

    results.map do |result|
      result.each_with_object({}).with_index do |(cell, acc), idx|
        column = columns[idx]
        acc[column] = cell[1]
      end
    end.to_json
  end
end