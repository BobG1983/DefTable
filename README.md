# DefTable

A Defold Asset library that contains a whole bunch of useful table manipulation functions split across two files:

* list_utils.lua - Focused around the manipulation of numerically indexed tables.  ie. "list-like" tables
* hash_utils.lua - Focused around the manipulation of key indexed tables.  ie. "hash-like" tables

## Installation

You can use DefTable in your own project by adding this project as a Defold library dependency. Open your game.project file and in the dependencies field under project add:

http://www.defold.com/p/35206/101529/archive

Once added you may require either (or both) of the two main lua

```
local list_utils = require("deftable.list_utils")
```

## List of Functions
### List Like Tables
* index_of
* for_each
* for_each_with_index
* map
* fold_left
* fold_right
* filter
* partition
* zip
* stitch
* all
* any
* member
* max
* min
* sum
* product

### Hash Like Tables
* key_of
* index_of
* for_each
* map
* reduce
* filter
* partition
* all
* any
* is_key
* is_value
* keys
* values
