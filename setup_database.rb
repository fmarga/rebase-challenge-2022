require 'csv'
require 'pg'

class SetupDatabase

  def initialize(csv)
    @csv = csv
  end

  def from_csv
    conn = PG.connect(host: 'postgres', user: 'postgres', password: 'pass')
    conn.exec('DROP TABLE IF EXISTS records')
    conn.exec(
            'CREATE TABLE records (
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
                      resultado_tipo_exame INT)
            '
    )

    rows = CSV.read(@csv, headers: true, col_sep: ';')
    rows.each do |row|
      conn.exec_params('INSERT INTO records  
                        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16)', [row[:cpf], row[:nome_paciente], row[:email_paciente], row[:data_nascimento_paciente], row[:endereco_rua_paciente], row[:cidade_paciente], row[:estado_paciente], row[:crm_medico], row[:crm_medico_estado], row[:nome_medico], row[:email_medico], row[:token_resultado_exame], row[:data_exame], row[:tipo_exame], row[:limites_tipo_exame], row[:resultado_tipo_exame]]
                      )
    end
    conn.close
  end
end