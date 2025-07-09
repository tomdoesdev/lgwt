#bin/zsh
set -e

DIR_NAME="$(git rev-parse --abbrev-ref HEAD)"
SOLUTIONS_DIR="./solutions"
if [ ! -d "$SOLUTIONS_DIR" ]; then
  echo "No solutions directory $SOLUTIONS_DIR"
  exit 1
fi
if [ ! -d "$SOLUTIONS_DIR/$DIR_NAME" ]; then
  mkdir "$SOLUTIONS_DIR/$DIR_NAME"
  echo "Directory '$SOLUTIONS_DIR/$DIR_NAME' created."
else
  echo "Directory '$SOLUTIONS_DIR/$DIR_NAME' already exists."
fi
