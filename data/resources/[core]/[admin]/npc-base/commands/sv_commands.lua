NPC.Commands = NPC.Commands or {}
NPC.Commands.Registered = NPC.Commands.Registered or {}

AddEventHandler("npc-base:exportsReady", function()
    addModule("Commands", NPC.Commands)
end)

function NPC.Commands.AddCommand(self, command, suggestion, source, cb, args)
    print('Hi from commands.')
    print("Adding command "..command)
    if NPC.Commands.Registered[command] then return end
      table.insert(NPC.Commands.Registered, { ['command'] = command, ['suggestion'] = suggestion, ['args'] = args })
      NPC.Commands.Registered[command] = true
    cb(ok)
end

function NPC.Commands.RemoveCommand(self, command, suggestion, source, cb, args)
    print('Command removed!')
    if not NPC.Commands.Registered[command] or nil then return end
      -- table.remove(NPC.Commands.Registered, { ['command'] = command, ['suggestion'] = suggestion, ['args'] = args })
    NPC.Commands.Registered[command] = false
    cb(ok)
end

RegisterCommand('commands', function()
  print(json.encode(NPC.Commands.Registered))
end)

--[[
AddEventHandler('chatMessage', function(Source, Color, Message)
    if Message:sub(1, 1) == '/' then
        local fullcmd = stringsplit(Message, ' ')
        local cmd = fullcmd[1]
		local Comment

		if #fullcmd > 1 then
			Comment = fullcmd[2]
			if #fullcmd > 2 then
				for i=3, #fullcmd do
					Comment = Comment .. ' ' .. fullcmd[i]
				end
			end
		end
		
        if cmd:lower() == '/savepos' then
        	TriggerClientEvent('CoordSaver:GetCoords', Source, Comment)
        	CancelEvent()
        end
    end
end)

function stringsplit(Input, Seperator)
	if Seperator == nil then
		Seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(Input, '([^'..Seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end
]]--