require 'test/unit'
require 'pg'
require './medical_records'

class ImportFromCsvTest < Test::Unit::TestCase
  def test_import_from_csv
    csv = CSV.read('./tests/test_data.csv', headers: true, col_sep: ';').map(&:fields)
    conn = PG.connect(host: 'postgres', user: 'postgres', password: 'pass')

    MedicalRecords.new('./tests/test_data.csv', 'postgres')
    db = conn.exec('SELECT * FROM records').map(&:values)

    assert_equal(db, csv)
  end
end