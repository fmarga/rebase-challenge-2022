# Endpoints

### GET /tests

- Mostra todos os resultados de exames cadastrados no banco de dados (resolução do desafio 1)
- Exemplo de resposta:

```json
[
  {
    "cpf": "048.973.170-88",
    "nome_paciente": "Emilly Batista Neto",
    "email_paciente": "gerald.crona@ebert-quigley.com",
    "data_nascimento_paciente": "2001-03-11",
    "endereco_rua_paciente": "165 Rua Rafaela",
    "cidade_paciente": "Ituverava",
    "estado_paciente": "Alagoas",
    "crm_medico": "B000BJ20J4",
    "crm_medico_estado": "PI",
    "nome_medico": "Maria Luiza Pires",
    "email_medico": "denna@wisozk.biz",
    "token_resultado_exame": "IQCZ17",
    "data_exame": "2021-08-05",
    "tipo_exame": "hemácias",
    "limites_tipo_exame": "45-52",
    "resultado_tipo_exame": "97"
  },
  {
    "cpf": "083.892.729-70",
    "nome_paciente": "João Samuel Garcês",
    "email_paciente": "madonna@gerhold-bode.io",
    "data_nascimento_paciente": "1967-07-06",
    "endereco_rua_paciente": "s/n Rua Bento",
    "cidade_paciente": "Taubaté",
    "estado_paciente": "Pará",
    "crm_medico": "B000BJ8TIA",
    "crm_medico_estado": "PR",
    "nome_medico": "Ana Sophia Aparício Neto",
    "email_medico": "corene.hane@pagac.io",
    "token_resultado_exame": "EMHUW2",
    "data_exame": "2021-04-20",
    "tipo_exame": "eletrólitos",
    "limites_tipo_exame": "2-68",
    "resultado_tipo_exame": "29"
  }
]
```
