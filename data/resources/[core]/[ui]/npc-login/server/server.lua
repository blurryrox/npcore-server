RegisterServerEvent('npc-login:disconnectPlayer')
AddEventHandler('npc-login:disconnectPlayer', function()
    local src = source
    DropPlayer(src, "You have been disconnected from the server!")
end)

RegisterServerEvent('npc-login:getPlayerInformation')
AddEventHandler('npc-login:getPlayerInformation', function()
    local src = source
end)

