# vec.lua
The simplest library to hold 2- and 3-dimensional vectors with some math operations

------------
#### Initializing the library
```lua
local vec = require("vec")
```
#### Creating a vector
```lua
print(vec.new(12, 12))
--result: (12, 12)
```
#### Adding and subtracting vectors
```lua
local smol = vec.new(1, 2)
local BIGG = vec.new(2, 3)
print(smol + BIGG) --result: (3, 5)
print(BIGG - smol) --result: (1, 1)
```
#### Multiplying vectors with vectors and numbers
```lua
local first = vec.new(1, 2)
local second = vec.new(2, 3)
print(first * second) --result: (2, 6)
print(first * 2) --result: (2, 4)
```
#### Dividing vectors with vectors and numbers
```lua
local first = vec.new(2, 6)
local second = vec.new(1, 2)
print(first / second) --result: (2, 3)
print(first / 2) --result: (1, 3)
```
#### Testing equality
```lua
local first = vec.new(1, 2)
local second = vec.new(1, 2)
local third = vec.new(1, 3)
print(first == second) --result: true
print(first == third) --result: false
```
