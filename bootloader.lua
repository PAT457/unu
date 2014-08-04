--[[
UnuOS Bootloader
--]]

local doShell
local apis = "/System/APIs/"
local w, h = term.getSize()

--[[
Loading the APIs
--]]
local function loadAPIs()
	--os.loadAPI(apis.."shell")
	os.loadAPI(apis.."system")
	os.loadAPI(apis.."draw")
	os.loadAPI(apis.."desktop")
	system.startScreen()
	sleep(1)
end


--[[
Show the screen
--]]
local function showScreen()
	local e, b = os.pullEvent("key")
	if b == 68 then
		term.clear()
		term.setCursorPos(1,1)
		doShell = true
	end
end

--Running the programs
parallel.waitForAny(showScreen, loadAPIs)

if doShell then
	term.clear()
	term.setCursorPos(1,1)

	elseif not doShell then
	shell.run("/System/boot/unu.lua")
	--Might Replace with BSoD in the future.
end

