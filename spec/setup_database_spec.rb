require 'spec_helper'
require 'pg'
require_relative '../data_connection'
require_relative '../setup_database'
require_relative '../result'

describe 'Setting up database' do
  it 'should connect properly with database and create table records' do
    SetDataConnection.connect
    SetupDatabase.drop_table
    SetupDatabase.table
    SetupDatabase.select_table

    result = SetDataConnection.connect.exec_params("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'").entries.last['table_name']

    expect(result).to eq 'records'
  end

  it 'should populate successfully' do
    SetDataConnection.connect
    SetupDatabase.drop_table
    SetupDatabase.table

    SetupDatabase.insert('./test_data.csv')
    results = Result.select_tests.to_json

    expect(results.length).to eq 2
  end
end