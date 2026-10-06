#!/usr/bin/env bash

set -e

echo "Criando role e database..."

docker exec -i db-lab-postgres \
psql -U postgres -d postgres \
< 00-ambiente/01-role.sql

echo "Criando schema..."

docker exec -i db-lab-postgres \
psql -U mario_lab -d db_lab \
< 00-ambiente/02-schema.sql

echo "Criando tabela..."

docker exec -i db-lab-postgres \
psql -U mario_lab -d db_lab \
< 00-ambiente/03-tabela.sql

echo "Inserindo dados..."

docker exec -i db-lab-postgres \
psql -U mario_lab -d db_lab \
< 00-ambiente/04-seed.sql

echo "Laboratório criado com sucesso."