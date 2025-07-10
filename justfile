# https://just.systems

run:
   #!/usr/bin/env zsh
   TARGET="$(git rev-parse --abbrev-ref HEAD)"
   go run "./solutions/$TARGET/$TARGET.go"

test scope="current":
    #!/usr/bin/env zsh
    set -e

    TEST_SCOPE="{{scope}}"
    TARGET="$(git rev-parse --abbrev-ref HEAD)"

    if [[ "$TEST_SCOPE" == "all" ]]; then
        go test ./solutions/...
    else
        if [[ -d "./solutions/$TARGET" ]]; then
            go test "./solutions/$TARGET/..."
        else
            echo "No solution directory found for branch '$TARGET'"
            exit 1
        fi
    fi


bench:
    #!/usr/bin/env zsh
    TARGET="$(git rev-parse --abbrev-ref HEAD)"
    go test -benchmem -bench=. ./solutions/$TARGET


init SOLUTION_NAME:
   #!/usr/bin/env zsh
           set -e

           SOLUTIONS_DIR="./solutions"
           SOLUTION_NAME="{{SOLUTION_NAME}}"

           git checkout main
           git pull origin main
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

