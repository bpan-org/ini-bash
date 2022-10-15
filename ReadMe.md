ini-bash
========

Read and write to INI files from Bash


## Synopsis

```
source ini.bash

ini:init foo.ini bar.ini

value=$(ini:get some.key)

ini:set some.key "$value"

ini:add some.key 'another value'

values=( $(ini:all some.key)

# list all key/value pairs (in all files):
ini:list
```


## Description

This library is a wrapper around `git config`.
It supports reading and writing to (Git style) INI files.
Like git, it can be set up to use a hierarchy of multiple INI files.


## Installation

* With [BPAN](
  https://github.com/bpan-org/bpan#installation):
  ```
  bpan install ini-bash
  ```


## Copyright and License

Copyright 2022 by Ingy döt Net

This is free software, licensed under:

The MIT (X11) License
