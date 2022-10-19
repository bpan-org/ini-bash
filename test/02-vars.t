#!/usr/bin/env bash

source test/init

source ini.bash

ini:init test/file1.ini
ini:vars SOME_VAR

SOME_VAR=foo

is "$(ini:get expand.this)" foo/123 \
  "Take value for key in mulitple files from last file"

done-testing
