#!/usr/bin/env bash

source test/init

source ini.bash

last=test/last.ini

echo '[foo]' > "$last"

trap 'rm -f test/last.ini' exit

ini:init test/file1.ini test/file2.ini "$last"

is "$(ini:get foo.aaa)" 333 \
  "Take value for key in mulitple files from last file"

is "$(ini:get foo.bbb)" 555 \
  "Take value for duplicate key from last value"

is "$(ini:get foo.ddd)" 666 \
  "Find key only in first file"

is "$(ini:get foo.ccc)" 444 \
  "Find key only in second file"

try ini:get foo.nope

is "$rc" 1 \
  "ini:get returns 1 for key not found"

is "$got" '' \
  "ini:get no output for key not found"

ini:set foo.new-key value

has "$(< "$last")" "new-key = value" \
  "File '$last' has ini:set value"

ini:add foo.new-key 'another value'

is "$(grep -c '^new-key' "$last")" \
  2 \
  "File '$last' has 2 foo.new-key entries"

is "$(ini:all foo.new-key)" $'value\nanother value' \
  "ini:all works"

is "$(ini:get --file=test/file1.ini foo.aaa)" 111 \
  "'ini:get --file=...' works"

done-testing
