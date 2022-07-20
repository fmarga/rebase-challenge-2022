require 'test/unit'
require 'net/http'
require 'pg'
require_relative '../data_connection'
require_relative '../setup_database'

class TestSetupDatabase < Test::Unit::TestCase
  def test_select_tests_success
    data = SetupDatabase.new.table
    data.insert('./test_data.csv')
    
    response = NET::HTTP.get_response('localhost', '/tests'), 3000

    assert_equal '200', response.code
    assert_equal 'application/json', response['Content-Type']
  end
end