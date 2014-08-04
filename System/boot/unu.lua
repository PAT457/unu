--[[
UnuOS
Wersja 1
--]]

local running = true
local w, h = term.getSize()

function os.pullEvent(filter)                         --OverRiding os.pullEvent
	local rets = {os.pullEventRaw(filter)}
	if rets[1] == "mouse_click" and rets[4] == h and rets[3] == w then
		system.switchToDesktop()
		else
		return unpack(rets)	
	end
end

function mainLoop()
	--Petli Glownej
	while running do
		desktop.reload()
		while true do
			local icons = desktop.getIconInfo(desktop.getIcons())
			local e, b, x, y = os.pullEvent()
			if e == "mouse_click" and y ~= h then
				for k, v in pairs(icons) do
					if x >= v.x-1 and x <= v.x+4 and y >= v.y and y <= v.y+3 then
						system.addProgram(v.lead.."App")
						break
					end
				end
			end
		end
	end
end

mainLoop()