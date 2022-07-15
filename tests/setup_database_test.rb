require 'test/unit'
require 'pg'
require './setup_database'

class SetupDatabaseTest < Test::Unit::TestCase
  def test_from_csv
    csv = CSV.read('./tests/test_data.csv', headers: true, col_sep: ';').map(&:fields)
    conn = PG.connect(host: 'postgres', user: 'postgres', password: 'pass')

    SetupDatabase.new('./tests/test_data.csv').from_csv
    db = conn.exec('SELECT * FROM records').map(&:values)

    assert_equal db, csv
  end
end