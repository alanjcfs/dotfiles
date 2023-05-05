slog() {
    git shortlog -sn --author=$1 --after=$2 --before=$3
}

gpatch() {
    git log --patch --author=$1 --after=$2 --before=$3
}
