# lua-mongoose
lua-mongoose is a Lua binding library for [Mongoose](https://github.com/cesanta/mongoose).

#### Getting and installing

```sh
$ git clone https://github.com/sodomon2/lua-mongoose.git
$ cd lua-mongoose
$ make
$ make install # or 'sudo make install'
```

#### Example

```lua
local mongoose = require("mongoose")

local function http_handle(ctx)
	for k,v in pairs(ctx) do
		print(k,v)
	end
	print()
	return "hello mongoose"
end


local server1 = mongoose.create(8080, http_handle)
local server2 = mongoose.create(9090, http_handle)
while true do
	server1:poll()
	server2:poll()
end

```
