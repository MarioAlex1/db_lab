#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Criando role e database..."

docker exec -i db-lab-postgres \
psql -U postgres -d postgres \
< "$SCRIPT_DIR/01-role.sql"

echo "Criando schema..."

docker exec -i db-lab-postgres \
psql -U mario_lab -d db_lab \
< "$SCRIPT_DIR/02-schema.sql"

echo "Criando tabela..."

docker exec -i db-lab-postgres \
psql -U mario_lab -d db_lab \
< "$SCRIPT_DIR/03-tabela.sql"

echo "Inserindo dados..."

docker exec -i db-lab-postgres \
psql -U mario_lab -d db_lab \
< "$SCRIPT_DIR/04-seed.sql"

echo "Laboratório criado com sucesso."