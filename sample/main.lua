--[[
local redis = require 'redis'
local client = redis.connect("192.168.0.106", 6379)
client:set('usr:nrk', string.rep("1", 66000))
client:set('usr:nobody', 5)
--local value1 = client:get('usr:nrk')
local value2 = client:get('usr:nobody')
print("value", value1, value2)]]

-- local repeatid = nil
-- local repeatcount = 0
-- local function test_repeat(arg1, arg2)
	-- repeatcount = repeatcount + 1
	-- print("in repeat: ", arg1, arg2, repeatcount, os.time(), os.clock())
	-- if repeatcount >= 5 then
		-- timer.close(repeatid)
	-- end
-- end

--timer.sleep(2)
-- timer.timeout(1, 1, 2, 3, 4, function(a, b, c, d) print("this is timeout", a, b, c, d) end)
--repeatid = timer.loop(1, 0.050, "this is repeat arg", test_repeat)


-- local result, socket = tcp.connect("61.135.169.125", 443, 0.030)
-- if not result then
	-- print("tcp connect fail", context.strerror(socket))
-- else
	-- print("tcp connect success", socket)
-- end

-- local result, listen_socket = tcp.listen("127.0.0.1", 7710)
-- if result then
	-- local result, socket = listen_socket:accept(5)
	-- if result then
		-- print("tcp accept success", socket)
	-- else
		-- print("tcp accept fail", context.strerror(socket))
	-- end
-- else
	-- print("tcp listen fail", context.strerror(listen_socket))
-- end
--print("hello world")

--local service = context.create("listen.lua", 8000)
--context.query(service, "hello", 1, function(result, query_data, handle, data) print("context.query",result, query_data, handle, data) end) 
--print("context.query", context.query(service, "hello", 1))
--print("context.recv/10", context.recv(0, 4))
--print("context.wait", context.wait(service, 5))
--context.wait(service, 2, function(result, error, handle) print(result, context.strerror(error), handle) end)
--timer.sleep(3)
--context.wait(service, nil)
--context.destroy(service)

-- timer.sleep(10)
-- timer.timeout(5, 1, 2, 3, 4, function(a, b, c, d) print("this is timeout", a, b, c, d) end)

-- local ret, con_sock = tcp.connect("10.6.10.59", 8801)
-- print(ret, con_sock)
-- -- local ret, buffer = con_sock:read()
-- -- print("tcp.connect", ret, ret and buffer:tostring())

-- do return end

-- #ifdef _WIN32
-- # define TEST_PIPENAME "\\\\.\\pipe\\uv-test"
-- # define TEST_PIPENAME_2 "\\\\.\\pipe\\uv-test2"
-- #else
-- # define TEST_PIPENAME "/tmp/uv-test-sock"
-- # define TEST_PIPENAME_2 "/tmp/uv-test-sock2"
-- #endif


package.cpath = package.cpath ..";"..".\\clib\\?.dll"
-- print(context.self(), package.path)
-- print(context.self(), package.cpath)
context.create("test.lua", 1, 2, 3)
context.create("test.lua", 1, 2, 3)
context.create("test.lua", 1, 2, 3)
context.create("test.lua", 1, 2, 3)
context.create("test.lua", 1, 2, 3)
local a = 0
for i = 1, 100 do
	a = a + 1
end

print(context.self(), context.thread(), package.path)
print(context.self(), context.thread(), package.cpath)
do return end

local ret, sock = tcp.listen("0.0.0.0", 8801)
if not ret then
	print("tcp.listens failed: ", context.strerror(sock))
else
	print("tcp.listens success: ", sock)
	sock:accept(function(result, accept_sock) print("sock:accept", result, accept_sock) sock:close() accept_sock:set_nodelay(false) accept_sock:write("hello world!") end)
	local ret, con_sock = tcp.connect("127.0.0.1", 8801)
	if ret then
		print("tcp.connect", ret, con_sock)
		local ret, buffer = con_sock:read()
		print("tcp read", ret, ret and buffer:tostring())
	else
		print("tcp.connect", ret, context.strerror(sock))
	end
end


do return end

local port = 8080

local pair_count = 10
local listen_services = {}
for i = 1, pair_count do
	listen_services[i] = context.create("listen.lua", port + i)
end
local connect_services = {}
for i = 1, pair_count do
	connect_services[i] = context.create("connect.lua", port + i)
end



print("main service exiting!")