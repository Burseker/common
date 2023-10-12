# !/bin/sh

# search_dir=/c/projects/DOCS/howto_and_hints
# search_dir=/storage/emulated/0/DCIM/Camera

PASSED=$1

if [[ ! -d $PASSED ]]; then
    echo "$PASSED is not valid directory"
    exit 1
fi

COUNTER=0

for entry in "$PASSED"/*
do
  if [[ -f $entry ]]; then
    echo $(stat -c "%s %W %Y" $entry) $(md5sum $entry | grep -o "^\S*") $(basename -- $entry)
    COUNTER=$((COUNTER+1))
  fi
done

echo "overal processed files: $COUNTER; overal files: $(find $PASSED -maxdepth 1  -type f | wc -l)"


