NPC.Events = NPC.Events or {}
NPC.Events.Registered = NPC.Events.Registered or {}

RegisterServerEvent("npc-events:listenEvent")
AddEventHandler("npc-events:listenEvent", function(id, name, args)
    local src = source

    if not NPC.Events.Registered[name] then return end

    NPC.Events.Registered[name].f(NPC.Events.Registered[name].mod, args, src, function(data)
        TriggerClientEvent("npc-events:listenEvent", src, id, data)
    end)
end)

function NPC.Events.AddEvent(self, module, func, name)
    NPC.Events.Registered[name] = {
        mod = module,
        f = func
    }
end