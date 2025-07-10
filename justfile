# https://just.systems

init SOLUTION_NAME:
   #!/usr/bin/env zsh
           set -e

           SOLUTIONS_DIR="./solutions"
           SOLUTION_NAME="{{SOLUTION_NAME}}"

           git checkout -b "$SOLUTION_NAME"

           DIR_NAME="$(git rev-parse --abbrev-ref HEAD)"

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

