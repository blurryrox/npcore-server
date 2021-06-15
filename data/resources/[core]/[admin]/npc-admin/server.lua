NPC = NPC or {}
NPC.Admin = NPC.Admin or {}
NPC._Admin = NPC._Admin or {}
NPC._Admin.Players = {}
NPC._Admin.DiscPlayers = {}

local Players = {}

RegisterServerEvent('npc-admin:Disconnect')
AddEventHandler('npc-admin:Disconnect', function(reason)
    DropPlayer(source, reason)
end)

RegisterServerEvent('admin:noclipFromClient')
AddEventHandler('admin:noclipFromClient', function()

end)

RegisterServerEvent('admin:isFlying')
AddEventHandler('admin:isFlying', function(data)
TriggerEvent('npc-admin:NoclipState', data)
end)

RegisterServerEvent('npc-admin:bringPlayerServer')
AddEventHandler('npc-admin:bringPlayerServer', function(data, playerID)
TriggerClientEvent('npc-admin:bringPlayer', playerID, data)
end)

RegisterServerEvent('npc-admin:setcloak')
AddEventHandler('npc-admin:setcloak', function(args)
    TriggerClientEvent('cloak', source, args)
end)

RegisterServerEvent('npc-admin:kick')
AddEventHandler('npc-admin:kick', function(kickid, reason)
    DropPlayer(kickid, reason)
end)


RegisterServerEvent('npc-admin:AddPlayer')
AddEventHandler("npc-admin:AddPlayer", function()
    local src = source
    local user = exports["npc-base"]:getModule("Player"):GetUser(src)
    local licenses
    local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end
    for _, v in pairs(identifiers) do
        if string.find(v, "license") then
            licenses = v
            break
        end
    end

    local stid = HexIdToSteamId(steamIdentifier)
    local ply = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local scomid = steamIdentifier:gsub("steam:", "")
    local licenseid = licenses:gsub("license:", "")
    local ping = GetPlayerPing(source)
    local data = { source = source, steamid = stid, comid = scomid, name = ply, hexid = user:getVar("hexid"), ip = ip, rank = NPC.Admin:GetPlayerRank(user), license = licenseid, ping = ping}
    table.insert(Players, source)
    TriggerClientEvent("npc-admin:AddPlayer", -1, data )
    NPC.Admin.AddAllPlayers()
end)

function NPC.Admin.AddAllPlayers(self)
    --local Players = GetPlayers()

    for i, _PlayerId in pairs(GetPlayers()) do
        
        local licenses
        local identifiers, steamIdentifier = GetPlayerIdentifiers(_PlayerId)
        for _, v in pairs(identifiers) do
            if string.find(v, "steam") then
                steamIdentifier = v
                break
            end
        end
        for _, v in pairs(identifiers) do
            if string.find(v, "license") then
                licenses = v
                break
            end
        end
        local ip = GetPlayerEndpoint(_PlayerId)
        local licenseid = licenses:gsub("license:", "")
        local ping = GetPlayerPing(_PlayerId)
        local stid = HexIdToSteamId(steamIdentifier)
        local ply = GetPlayerName(_PlayerId)
        local scomid = steamIdentifier:gsub("steam:", "")
        local data = { src = tonumber(_PlayerId), steamid = stid, comid = scomid, name = ply, ip = ip, license = licenseid, ping = ping }

        TriggerClientEvent("npc-admin:AddAllPlayers", source, data)

    end
end

function NPC.Admin.AddPlayerS(self, data)
    NPC._Admin.Players[data.src] = data
end

AddEventHandler("playerDropped", function()
	local licenses
    local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end
    for _, v in pairs(identifiers) do
        if string.find(v, "license") then
            licenses = v
            break
        end
    end

    local stid = HexIdToSteamId(steamIdentifier)
    local ply = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local scomid = steamIdentifier:gsub("steam:", "")
    local licenseid = licenses:gsub("license:", "")
    local ping = GetPlayerPing(source)
    local data = { src = source, steamid = stid, comid = scomid, name = ply, ip = ip, license = licenseid, ping = ping}

    TriggerClientEvent("npc-admin:RemovePlayer", -1, data )
    Wait(600000)
    TriggerClientEvent("npc-admin:RemoveRecent", -1, data)
end)

function HexIdToSteamId(hexId)
    local cid = math.floor(tonumber(string.sub(hexId, 7), 16))
	local steam64 = math.floor(tonumber(string.sub( cid, 2)))
	local a = steam64 % 2 == 0 and 0 or 1
	local b = math.floor(math.abs(6561197960265728 - steam64 - a) / 2)
	local sid = "STEAM_0:"..a..":"..(a == 1 and b -1 or b)
    return sid
end

-- local sex {
--     ["name"] = "text",
    
-- }

RegisterServerEvent("server:enablehuddebug")
AddEventHandler("server:enablehuddebug", function(enable)
        debug = not debug
        local src = source
        if debug then
            exports["npc-based-resources"]:AddLog("Admin", GetPlayerName(src), "Dev Debug", {item = tostring("Enabled")}) 
            TriggerClientEvent('hud:enabledebug', src)
        else
            exports["npc-based-resources"]:AddLog("Admin", GetPlayerName(src), "Dev Debug", {item = tostring("Disabled")}) 
            TriggerClientEvent('hud:enabledebug', src)
        end
end)


RegisterServerEvent('npc-admin:runCommand')
AddEventHandler('npc-admin:runCommand', function(data)
    local src = source

    TriggerClientEvent('npc-admin:RunClCommand', src, data.command, data)

    if NPC._Admin.Commands[data.command].runcommand then
        local caller = {
            source = src,
            name = GetPlayerName(src),
            steamid = GetPlayerIdentifiers(src)[1],
            getVar = function(self, key) return self[key] end,
        }
        NPC._Admin.Commands[data.command].runcommand(caller, data)
    end
end)

RegisterServerEvent('admin:dumpCurrentPlayers')
AddEventHandler('admin:dumpCurrentPlayers', function()

end)

function NPC.Admin.reBuildAdmin(self, user,src)
    if not user then return end
    if not self:IsValidUser(user) then return end
    if self:IsAdmin(user) then
        local commands = exports["npc-base"]:getModule("Commands")
        commands:removeCommand("/menu", src)
        commands:removeCommand("/heatmap", src)
        commands:removeCommand("/polystart", src)
        commands:removeCommand("/polyadd", src)
        commands:removeCommand("/polyremove", src)
        commands:removeCommand("/polyend", src)

        commands:AddCommand("/heatmap", "Toggel Display Heatmap", src, function(src, args)
            TriggerEvent("heatmap:display", src)
        end)

        commands:AddCommand("/menu", "Opens the admin menu", src, function(src, args)
            TriggerClientEvent("npc-admin:openMenu", src)
        end)

        commands:AddCommand("/polystart", "Start building shape", src, function(src, args)
            local name = ""
            for i = 2, #args do
                name = name .. " " .. args[i]
            end
            TriggerClientEvent("pz_startshape", src, name)
        end)

        commands:AddCommand("/polyadd", "Add a point to the shape", src, function(src, args)
            TriggerClientEvent("pz_addpoint", src)
        end)

        commands:AddCommand("/polyremove", "Remove last point of the shape", src, function(src, args)
            TriggerClientEvent("pz_removepoint", src)
        end)

        commands:AddCommand("/polyend", "Stop building shape", src, function(src, args)
            TriggerClientEvent("pz_endshape", src)
        end)
    else
        commands:removeCommand("/menu", src)
        commands:removeCommand("/heatmap", src)
        commands:removeCommand("/polystart", src)
        commands:removeCommand("/polyadd", src)
        commands:removeCommand("/polyremove", src)
        commands:removeCommand("/polyend", src)
        TriggerClientEvent("npc-admin:noLongerAdmin", src)
    end
end