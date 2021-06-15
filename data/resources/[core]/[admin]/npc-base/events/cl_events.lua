NPC.Events = NPC.Events or {}
NPC.Events.Total = 0
NPC.Events.Active = {}

function NPC.Events.Trigger(self, event, args, callback)
    local id = NPC.Events.Total + 1
    NPC.Events.Total = id

    id = event .. ":" .. id

    if NPC.Events.Active[id] then return end

    NPC.Events.Active[id] = {cb = callback}
    
    TriggerServerEvent("npc-events:listenEvent", id, event, args)
end

RegisterNetEvent("npc-events:listenEvent")
AddEventHandler("npc-events:listenEvent", function(id, data)
    local ev = NPC.Events.Active[id]
    
    if ev then
        ev.cb(data)
        NPC.Events.Active[id] = nil
    end
end)