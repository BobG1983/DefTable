# DefTable

A Defold Asset library that contains a whole bunch of useful table manipulation functions split across two files:

* list_utils.lua
    * Focused around the manipulation of numerically indexed tables. ie. "list-like" tables
* hash_utils.lua
    * Focused around the manipulation of key indexed tables. ie. "hash-like" tables

## Installation

You can use DefTable in your own project by adding this project as a Defold library dependency. Open your game.project file and in the dependencies field under project add:

https://github.com/ShriekBob/DefTable/archive/master.zip

Once added you may require either (or both) of the two main lua

```
local list_utils = require("deftable.list_utils")
```

## List of Functions
### List Like Tables

#### index_of
```
local i, success = index_of(element, list)
```
Returns the the index of _element_, and _true_, if _element_ is in _list_. Returns _nil_ and _false_ otherwise.

#### for_each
```
for_each(func, list)
```
Calls _func(element, index)_ for every element in _list_.

#### map
```
local new_list = map(func, list)
```

Calls _func(element)_ for every element in _list_ returning a new list-like table containing the first return value from each call of _func_, excluding _nil_ return values.

#### fold_left
```
local accumulated = fold_left(func, accumulator, list)
```
Calls _func(accumulator, element)_ for each element in _list_ adding the first return value of _func_ to _accumulator_. Returns the final value of _accumulator_. _list_ is processed from _1_ to _#list_.

#### fold_right
```
local accumulated = fold_right(func, accumulator, list)
```
Calls _func(accumulator, element)_ for each element in _list_ adding the first return value of _func_ to _accumulator_. Returns the final value of _accumulator_. _list_ is processed from _#list_ to _1_.

#### filter
```
local filtered_list = filter(predicate, list)
```
Returns a new list-like table containing all the elements of _list_ for which _predicate(element)_ returns _true_.

#### partition
```
local hits, misses = partition(predicate, list)
```
Returns two new list-like tables; the first containing all the elements of _list_ for which _predicate(element)_ returns _true_; the second containing all elements of _list_ for which _predicate(element)_ returns _false_.

#### zip
```
local zipped = zip(list1, list2)
```
Returns a new list-like table where each element is { _list1[i]_, _list2[i]_ } up to the length of the shortest of _list1_ or _list2_.

#### stitch
```
local stitched = stitch(list1, list2)
```
Returns a new list-like table where each element has a key of _list1[i]_ and a value of _list2[i]_ up to the length of the shortest of _list1_ or _list2_.

#### all
```
local success = all(predicate, list)
```
Calls _predicate(element)_ for each value in _list_ returning _true_ only if _predicate(element)_ returns true for __every__ element in _list_. Otherwise returns _false_.

#### any
```
local success = any(predicate, list)
```
Calls _predicate(element)_ for each value in _list_ returning _true_ if _predicate(element)_ returns _true_ for __any__ element in _list_. Otherwise returns _false_.

#### member
```
local success = member(element, list)
```
Returns _true_ if _element_ is in _list_.

#### max
```
local biggest_member = max(list)
```
Returns the largest element of _list_, assumes elements in _list_ can be compared with _x > y_.

#### min
```
local smallest_member = min(list)
```
Returns the smallest element of _list_, assumes elements in _list_ can be compared with _x < y_.

#### sum
```
local total = sum(list)
```
Returns the sum of every element in _list_, assumes elements in _list_ can be summed with _x + y_.

#### product
```
local total = product(list)
```
Returns the product of every element in _list_, assumes elements in _list_ can be multiplied with _x * y_.

### Hash Like Tables
#### key_of
```
local key = key_of(value, hash)
```
Returns the key of the element whose value matches _value_ in _hash_.

#### index_of
```
local index = index_of(value, hash)
```
Returns the index of the element whose value matches _value_ in _hash_.

#### for_each
```
for_each(func, hash)
```
Calls _func(key, value)_ for every element in _hash_.

#### map
```
local new_list = map(func, list)
```

Calls _func(key, value, mapped)_ for every key and value in _hash_. Returns the final value of _mapped_.

#### reduce
```
local new_list = reduce(func, accumulator, hash)
```

Calls _func(key, value, accumulator)_ for every key and value in _hash_. Sets _accumulator_ to the first return value of _func_ on each iteration.  Returns the final value of _accumulator_.

#### filter
```
local filtered_hash = filter(predicate, hash)
```
Returns a new hash-like table containing all the elements of _list_ for which _predicate(element)_ returns _true_.

#### partition
```
local hits, misses = partition(predicate, hash)
```
Returns two new hash-like tables; the first containing all the elements of _hash_ for which _predicate(element)_ returns true; the second containing all elements of _hash_ for which _predicate(element)_ returns _false_.

#### all
```
local success = all(predicate, hash)
```
Calls _predicate(key, value)_ for each value in _hash_ returning _true_ only if _predicate(key, value)_ returns true for __every__ element in _hash_. Otherwise returns _false_.

#### any
```
local success = any(predicate, _hash_)
```
Calls _predicate(key, value)_ for each value in _hash_ returning _true_ if _predicate(key, value)_ returns _true_ for __any__ element in _hash_. Otherwise returns _false_.

#### is_key
```
local success = is_key(wanted, hash)
```
Returns true if _wanted_ occurs as a key in _hash_.  Otherwise returns _false_.

#### is_value
```
local success = is_value(wanted, hash)
```
Returns true if _wanted_ occurs as a value in _hash_.  Otherwise returns _false_.

#### keys
```
local keys = keys(hash)
```
Returns a new list-like table containing all of the keys in _hash_.

#### values
```
local values = values(hash)
```
Returns a new list-like table containing all of the values in _hash_.
