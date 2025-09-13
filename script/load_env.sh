#!/usr/bin/env bash
# Carrega variáveis do arquivo .env para a sessão atual (Linux/macOS)
set -o allexport
if [ -f .env ]; then
  source .env
  echo "Variáveis do .env carregadas para a sessão atual."
else
  echo ".env não encontrado. Copie .env.example para .env e preencha as chaves."
fi
set +o allexport
