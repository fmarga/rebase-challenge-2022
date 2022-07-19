require 'pg'

class SetDataConnection
  def self.connect
    conn = PG.connect(host: 'postgres', user: 'postgres', password: 'pass')
  end
end