NPC.Player = NPC.Player or {}
NPC.LocalPlayer = NPC.LocalPlayer or {}

local function GetUser()
    return NPC.LocalPlayer
end

function NPC.LocalPlayer.setVar(self, var, data)
    GetUser()[var] = data
end

function NPC.LocalPlayer.getVar(self, var)
    return GetUser()[var]
end

function NPC.LocalPlayer.setCurrentCharacter(self, data)
    if not data then return end
    GetUser():setVar("character", data)
end

function NPC.LocalPlayer.getCurrentCharacter(self)
    return GetUser():getVar("character")
end

RegisterNetEvent("npc-base:networkVar")
AddEventHandler("npc-base:networkVar", function(var, val)
    NPC.LocalPlayer:setVar(var, val)
end)