require 'pg'

class SetDataConnection
  def self.connect
    PG.connect(host: ENV['DB'], user: 'postgres', password: 'pass')
  end
end