# Rebase Challenge 2022

Você pode encontrar o link do repositório original [aqui](https://git.campuscode.com.br/core-team/rebase-challenge-2022/-/blob/6b40ad138141f23b70b6ada9ee41fc7a7eb6c84c/run)

### API em Ruby para listagem de exames médicos.

## Tech Stack

- Docker
- Ruby
- PostgreSQL
- Sidekiq
- Redis

## Running

No seu terminal, digite:

```bash
$ docker compose up -d
```

ou, se preferir:

```bash
$ bash run
```

- Para acessar a listagem de todos os exames cadastrados:
  http://localhost:3000/tests

- Para acessar exames relacionados a um token específico:
  http://localhost:3000/tests/:token

- Para adicionar ao banco de dados uma tabela CSV:
  http://localhost:3000/import

## Docs

Você pode encontrar a documentação da API, com os exemplos de resposta para os endpoints [aqui](https://github.com/fmarga/rebase-challenge-2022/blob/main/API.md)

## Running tests

Depois de subir os containeres com o comando acima citado, execute o seguinte comando:

```bash
$ docker exec -it app bundle exec rspec
```
