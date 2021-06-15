NPC.Commands = NPC.Commands or {}
NPC.Commands.Registered = NPC.Commands.Registered or {}

NPC.Commands.AddCommand("me", "Displays 3d text on character.", {}, false, function(source, args)
	local text = table.concat(args, ' ')
	TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
end)