#!/bin/bash

# ============================================================
# DOWNLOAD DE DATASETS COM SRA TOOLKIT
# ============================================================

# Interrompe o script se ocorrer algum erro:
set -euo pipefail

# Número de threads:
THREADS=8

# Diretório principal:
BASE_DIR="$(pwd)"
PROJECT_DIR="$BASE_DIR/SRA_PROJECT"

# Diretórios de trabalho:
SRA_DIR="$PROJECT_DIR/SRA"
RAW_DIR="$PROJECT_DIR/FASTQ"
TEMP_DIR="$PROJECT_DIR/TEMP"

# Criando os diretórios:
mkdir -p "$SRA_DIR" "$RAW_DIR" "$TEMP_DIR"

# Lista de acessos:
ACCESSIONS=(
SRR1176848
SRR1176849
)

# Iniciando o processamento:
echo ">>> Iniciando download de ${#ACCESSIONS[@]} amostras"

for ACC in "${ACCESSIONS[@]}"
do

    echo "------------------------------------------"
    echo ">>> Processando: $ACC"
    echo "------------------------------------------"

    # 1. Download do arquivo SRA:
    echo ">>> Baixando $ACC..."

    prefetch "$ACC" \
    --output-directory "$SRA_DIR"

    # 2. Conversão SRA -> FASTQ:
    echo ">>> Convertendo $ACC para FASTQ..."

    fasterq-dump "$SRA_DIR/$ACC/$ACC.sra" \
    --split-files \
    --threads "$THREADS" \
    --temp "$TEMP_DIR/$ACC" \
    --outdir "$RAW_DIR"

    # 3. Compactação:
    echo ">>> Compactando arquivos..."

    if [ -f "$RAW_DIR/${ACC}_1.fastq" ]; then
        gzip "$RAW_DIR/${ACC}_1.fastq"
    fi

    if [ -f "$RAW_DIR/${ACC}_2.fastq" ]; then
        gzip "$RAW_DIR/${ACC}_2.fastq"
    fi

    # Caso exista arquivo single-end:
    if [ -f "$RAW_DIR/${ACC}.fastq" ]; then
        gzip "$RAW_DIR/${ACC}.fastq"
    fi

    # 4. Remoção dos arquivos SRA:
    echo ">>> Removendo arquivo SRA de $ACC..."

    rm -rf "$SRA_DIR/$ACC"

    # Remoção dos arquivos temporários da amostra:
    rm -rf "$TEMP_DIR/$ACC"

    echo "$ACC concluído."

done

echo ">>> Download do conjunto de dados concluído com sucesso!"