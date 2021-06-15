NPC.Core = NPC.Core or {}

function NPC.Core.ConsoleLog(self, msg, mod)
    if not tostring(msg) then return end
    if not tostring(mod) then mod = "No Module" end
    
    local pMsg = string.format("[NPC LOG - %s] %s", mod, msg)
    if not pMsg then return end

    print(pMsg)
end

RegisterNetEvent("npc-base:consoleLog")
AddEventHandler("npc-base:consoleLog", function(msg, mod)
    NPC.Core:ConsoleLog(msg, mod)
end)

function getModule(module)
    if not NPC[module] then print("Warning: '" .. tostring(module) .. "' module doesn't exist.") return false end
    return NPC[module]
end

function addModule(module, tbl)
    if NPC[module] then print("Warning: '" .. tostring(module) .. "' module is being overridden.") end
    NPC[module] = tbl
end

NPC.Core.ExportsReady = false

function NPC.Core.WaitForExports(self)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if exports and exports["npc-base"] then
                TriggerEvent("npc-base:exportsReady")
                NPC.Core.ExportsReady = true
                return
            end
        end
    end)
end

NPC.Core:WaitForExports()