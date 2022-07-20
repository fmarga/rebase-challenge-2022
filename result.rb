require 'pg'
require 'csv'
require './data_connection'
require './setup_database'

class Result

  def self.select_tests
    results = SetupDatabase.select_table

    columns = results.fields

    results.map do |result|
      result.each_with_object({}).with_index do |(cell, acc), idx|
        column = columns[idx]
        acc[column] = cell[1]
      end
    end
  end

  def self.find_token(token)
    conn = SetDataConnection.connect
    patient = conn.exec_params("SELECT token_resultado_exame, data_exame, cpf, nome_paciente, email_paciente, data_nascimento_paciente FROM records WHERE token_resultado_exame = '#{token}'").to_a
    doc = conn.exec_params("SELECT crm_medico, crm_medico_estado, nome_medico FROM records WHERE token_resultado_exame = '#{token}'").to_a
    tests = conn.exec_params("SELECT tipo_exame, limites_tipo_exame, resultado_tipo_exame FROM records WHERE token_resultado_exame = '#{token}'").to_a

    result = patient.first
    result = result.merge('doctor' => doc.first)
    result = result.merge('tests' => tests)

    result
  end
end