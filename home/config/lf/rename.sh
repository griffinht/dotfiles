exit 1
# todo
set -xe
temp="$(mktemp)"
cat > "$temp"
nvim "$temp"
cat "$temp"
rm "$temp"
