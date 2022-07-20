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

### GET /tests/:token

- Mostra todos os resultados de exames referentes ao token informado (resolução do desafio 3)
- Exemplo de resposta:

```json
{
  "token_resultado_exame": "T9O6AI",
  "data_exame": "2021-11-21",
  "cpf": "066.126.400-90",
  "nome_paciente": "Matheus Barroso",
  "email_paciente": "maricela@streich.com",
  "data_nascimento_paciente": "1972-03-09",
  "doctor": {
    "crm_medico": "B000B7CDX4",
    "crm_medico_estado": "SP",
    "nome_medico": "Sra. Calebe Louzada"
  },
  "tests": [
    {
      "tipo_exame": "hemácias",
      "limites_tipo_exame": "45-52",
      "resultado_tipo_exame": "48"
    },
    {
      "tipo_exame": "leucócitos",
      "limites_tipo_exame": "9-61",
      "resultado_tipo_exame": "75"
    },
    {
      "tipo_exame": "plaquetas",
      "limites_tipo_exame": "11-93",
      "resultado_tipo_exame": "67"
    },
    {
      "tipo_exame": "hdl",
      "limites_tipo_exame": "19-75",
      "resultado_tipo_exame": "3"
    },
    {
      "tipo_exame": "ldl",
      "limites_tipo_exame": "45-54",
      "resultado_tipo_exame": "27"
    },
    {
      "tipo_exame": "vldl",
      "limites_tipo_exame": "48-72",
      "resultado_tipo_exame": "27"
    },
    {
      "tipo_exame": "glicemia",
      "limites_tipo_exame": "25-83",
      "resultado_tipo_exame": "78"
    },
    {
      "tipo_exame": "tgo",
      "limites_tipo_exame": "50-84",
      "resultado_tipo_exame": "15"
    },
    {
      "tipo_exame": "tgp",
      "limites_tipo_exame": "38-63",
      "resultado_tipo_exame": "34"
    },
    {
      "tipo_exame": "eletrólitos",
      "limites_tipo_exame": "2-68",
      "resultado_tipo_exame": "92"
    },
    {
      "tipo_exame": "tsh",
      "limites_tipo_exame": "25-80",
      "resultado_tipo_exame": "21"
    },
    {
      "tipo_exame": "t4-livre",
      "limites_tipo_exame": "34-60",
      "resultado_tipo_exame": "95"
    },
    {
      "tipo_exame": "ácido úrico",
      "limites_tipo_exame": "15-61",
      "resultado_tipo_exame": "10"
    }
  ]
}
```
