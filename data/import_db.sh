#!/bin/bash
# Import 'dump.sql' from the same directory as this script

# Get directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Get project root (parent of data folder)
PROJECT_ROOT="$DIR/.."
DUMP_FILE="$DIR/dump.sql"

if [ ! -f "$DUMP_FILE" ]; then
    echo "Error: dump.sql not found in $DIR!"
    exit 1
fi

# Switch to project root for docker compose context
cd "$PROJECT_ROOT"

echo "Restoring database 'garden_db' from '$DUMP_FILE'..."
cat "$DUMP_FILE" | docker compose exec -T db psql -U postgres -d garden_db

echo "Done! Database restored."
