require 'pg'

class SetDataConnection
  def self.connect
    PG.connect(host: 'postgres', user: 'postgres', password: 'pass')
  end
end