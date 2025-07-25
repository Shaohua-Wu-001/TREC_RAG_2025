#!/bin/bash
set -e
TIMESTAMP=$1
CONFIG_DIR=$2
LOG_DIR=$3
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_DIR/bm25_retrieval_${TIMESTAMP}.log"
}
log "Running BM25 retrieval..."
python src/retrieval/run_sparse_retrieval.py \
    --config "$CONFIG_DIR/retrieval_config.yaml" \
    --index "indexes/bm25" \
    --output "runs/retrieval/bm25_${TIMESTAMP}.txt" \
    --log-file "$LOG_DIR/bm25_retrieval_${TIMESTAMP}.log"
log "BM25 retrieval completed!" 