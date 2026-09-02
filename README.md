# SQL Fundamentals

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-4169E1?logo=postgresql&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?logo=node.js&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?logo=typescript&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Biome](https://img.shields.io/badge/Biome-60A5FA?logo=biome&logoColor=white)
![pnpm](https://img.shields.io/badge/pnpm-F69220?logo=pnpm&logoColor=white)

Projeto de estudos sobre fundamentos de SQL e PostgreSQL, com scripts SQL organizados por tema e um pequeno servidor Node.js que demonstra transações via [`pg`](https://node-postgres.com/).

## Stack

| Ferramenta | Uso |
| --- | --- |
| **PostgreSQL 17** | Banco de dados (via Docker) |
| **Node.js + TypeScript** | Servidor de exemplo (executado com [tsx](https://tsx.is/)) |
| **pg** | Driver PostgreSQL para Node |
| **Biome** | Lint e formatação |
| **Husky + commitlint** | Hooks de commit (padrão gitmoji) |
| **pnpm** | Gerenciador de pacotes |

## Como rodar

```bash
# sobe o PostgreSQL (porta 5432) e executa o init.sql
docker compose up -d

# roda um script SQL dentro do container
docker exec -it sql_fundamentals psql -U root -f /scripts/3-triggers.sql

# roda o servidor de exemplo
cd server && pnpm install && pnpm dev
```

## Temas abordados

| Tema | Conteúdo |
| --- | --- |
| **Fundamentos** | Criação de tabelas, CRUD e `ALTER TABLE` |
| **Estruturas** | Funções, views, constraints, chaves primárias e estrangeiras |
| **Consultas** | Joins, JSON e índices |
| **Subqueries** | Subqueries correlacionadas e `HAVING` |
| **Transações** | SQL puro e via Node, savepoints e rollback |
| **Concorrência** | Locking pessimista (`FOR UPDATE`) e concorrência otimista |
| **Triggers** | Triggers `BEFORE`/`AFTER` e funções `plpgsql` |
