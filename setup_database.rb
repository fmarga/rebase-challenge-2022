require 'pg'
require 'csv'

class SetupDatabase
  def initialize
    conn = PG.connect(host: 'postgres', user: 'postgres', password: 'pass')
  end

  def table
    conn = exec('DROP TABLE IF EXISTS records')
    conn.exec(
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

  def insert(data)
    rows = CSV.new(data, headers: true, col_sep: ';')
    rows.each do |row|
      conn.exec_params('INSERT INTO records VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16)', row.fields)
    end
  end
end