require 'pg'
require 'csv'
require './data_connection'

class SetupDatabase
  @conn = SetDataConnection.connect

  def self.drop_table
    @conn.exec('DROP TABLE IF EXISTS records')
  end

  def self.table 
    @conn.exec(
      "CREATE TABLE records (
                cpf VARCHAR(20),
                nome_paciente VARCHAR(200),
                email_paciente VARCHAR(200),
                data_nascimento_paciente DATE,
                endereco_rua_paciente VARCHAR(200),
                cidade_paciente VARCHAR(100),
                estado_paciente VARCHAR(50),
                crm_medico VARCHAR(50),
                crm_medico_estado VARCHAR(50),
                nome_medico VARCHAR(200),
                email_medico VARCHAR(200),
                token_resultado_exame VARCHAR(10),
                data_exame DATE,
                tipo_exame VARCHAR(100),
                limites_tipo_exame VARCHAR(50),
                resultado_tipo_exame INT);
      ")
  end

  def self.insert(csv)
    rows = CSV.new(csv, headers: true, col_sep: ';')
    rows.each do |row|
      @conn.exec_params('INSERT INTO records VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16)', row.fields)
    end
  end

  def self.select_table
    @conn.exec_params('SELECT * FROM records')
  end
end