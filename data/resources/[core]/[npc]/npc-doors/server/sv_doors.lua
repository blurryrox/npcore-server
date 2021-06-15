local steamIds = {
    ["steam:11000013218ef32"] = true, --syd
    ["steam:1100001113b37ba"] = true, --syd
}

RegisterServerEvent('npc-doors:alterlockstate2')
AddEventHandler('npc-doors:alterlockstate2', function()
    NPC.DoorCoords[10]["lock"] = 0
    NPC.DoorCoords[11]["lock"] = 0
    NPC.DoorCoords[12]["lock"] = 0
    NPC.DoorCoords[39]["lock"] = 0
    NPC.DoorCoords[40]["lock"] = 0
    NPC.DoorCoords[41]["lock"] = 0
    NPC.DoorCoords[42]["lock"] = 0
    NPC.DoorCoords[44]["lock"] = 0
    NPC.DoorCoords[45]["lock"] = 0
    NPC.DoorCoords[46]["lock"] = 0
    NPC.DoorCoords[47]["lock"] = 0
    NPC.DoorCoords[48]["lock"] = 0
    NPC.DoorCoords[49]["lock"] = 0
    NPC.DoorCoords[50]["lock"] = 0
    NPC.DoorCoords[51]["lock"] = 0
    NPC.DoorCoords[52]["lock"] = 0
    NPC.DoorCoords[53]["lock"] = 0
    NPC.DoorCoords[54]["lock"] = 0
    NPC.DoorCoords[55]["lock"] = 0
    NPC.DoorCoords[56]["lock"] = 0

    TriggerClientEvent('npc-doors:alterlockstateclient', source, NPC.DoorCoords)

end)

RegisterServerEvent('npc-doors:alterlockstate')
AddEventHandler('npc-doors:alterlockstate', function(alterNum)
    NPC.alterState(alterNum)
end)

RegisterServerEvent('npc-doors:ForceLockState')
AddEventHandler('npc-doors:ForceLockState', function(alterNum, state)
    NPC.DoorCoords[alterNum]["lock"] = state
    TriggerClientEvent('NPC:Door:alterState', -1, alterNum, state)
end)

RegisterServerEvent('npc-doors:requestlatest')
AddEventHandler('npc-doors:requestlatest', function()
    local src = source 
    local steamcheck = GetPlayerIdentifiers(source)[1]
    if steamIds[steamcheck] then
        TriggerClientEvent('doors:HasKeys',src,true)
    end
    TriggerClientEvent('npc-doors:alterlockstateclient', source,NPC.DoorCoords)
end)

function isDoorLocked(door)
    if NPC.DoorCoords[door].lock == 1 then
        return true
    else
        return false
    end
end