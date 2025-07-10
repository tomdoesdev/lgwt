# https://just.systems

run:
   #!/usr/bin/env zsh
   TARGET="$(git rev-parse --abbrev-ref HEAD)"
   go run "./solutions/$TARGET/$TARGET.go"

test:
   #!/usr/bin/env zsh
   TARGET="$(git rev-parse --abbrev-ref HEAD)"
   go test "./solutions/$TARGET/"

bench:
    #!/usr/bin/env zsh
    TARGET="$(git rev-parse --abbrev-ref HEAD)"
    go test -bench=. ./solutions/$TARGET


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

           cd '$SOLUTIONS_DIR/$DIR_NAME

