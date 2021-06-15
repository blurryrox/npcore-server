local NPC = NPC or {}
NPC.Scoreboard = {}
NPC._Scoreboard = {}

NPC.Scoreboard.Menu = {}

NPC._Scoreboard.Players = {}
NPC._Scoreboard.Recent = {}
NPC._Scoreboard.SelectedPlayer = nil
NPC._Scoreboard.MenuOpen = false
NPC._Scoreboard.Menus = {}

local function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function NPC.Scoreboard.AddPlayer(self, data)
    NPC._Scoreboard.Players[data.src] = data
end

function NPC.Scoreboard.RemovePlayer(self, data)
    NPC._Scoreboard.Players[data.src] = nil
    NPC._Scoreboard.Recent[data.src] = data
end

function NPC.Scoreboard.RemoveRecent(self, src)
    NPC._Scoreboard.Recent[src] = nil
end

function NPC.Scoreboard.AddAllPlayers(self, data, recentData)
    NPC._Scoreboard.Players[data.src] = data
    NPC._Scoreboard.Recent[recentData.src] = recentData
end

function NPC.Scoreboard.GetPlayerCount(self)
    local count = 0

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then count = count + 1 end
    end

    return count
end

Citizen.CreateThread(function()
    local function DrawMain()
        if WarMenu.Button("Total:", tostring(NPC.Scoreboard:GetPlayerCount()), {r = 135, g = 206, b = 250, a = 150}) then end

        for k,v in spairs(NPC._Scoreboard.Players, function(t, a, b) return t[a].src < t[b].src end) do
            local playerId = GetPlayerFromServerId(v.src)

            if NetworkIsPlayerActive(playerId) or GetPlayerPed(playerId) == PlayerPedId() then
                if WarMenu.MenuButton("[" .. v.src .. "] " .. v.steamid .. " ", "options") then NPC._Scoreboard.SelectedPlayer = v end
            else
                if WarMenu.MenuButton("[" .. v.src .. "] - instanced?", "options", {r = 255, g = 0, b = 0, a = 255}) then NPC._Scoreboard.SelectedPlayer = v end
            end
        end

        

        if WarMenu.MenuButton("Recent D/C's", "recent") then
        end
    end

    local function DrawRecent()
        for k,v in spairs(NPC._Scoreboard.Recent, function(t, a, b) return t[a].src < t[b].src end) do
            if WarMenu.MenuButton("[" .. v.src .. "] " .. v.name, "options") then NPC._Scoreboard.SelectedPlayer = v end
        end
    end

    local function DrawOptions()
        if WarMenu.Button("Steam ID:", NPC._Scoreboard.SelectedPlayer.steamid) then end
        if WarMenu.Button("Community ID:", NPC._Scoreboard.SelectedPlayer.comid) then end
        if WarMenu.Button("Server ID:", NPC._Scoreboard.SelectedPlayer.src) then end
    end

    NPC._Scoreboard.Menus = {
        ["scoreboard"] = DrawMain,
        ["recent"] = DrawRecent,
        ["options"] = DrawOptions
    }

    local function Init()
        WarMenu.CreateMenu("scoreboard", "Player List")
        WarMenu.SetSubTitle("scoreboard", "Players")

        WarMenu.SetMenuWidth("scoreboard", 0.5)
        WarMenu.SetMenuX("scoreboard", 0.71)
        WarMenu.SetMenuY("scoreboard", 0.017)
        WarMenu.SetMenuMaxOptionCountOnScreen("scoreboard", 30)
        WarMenu.SetTitleColor("scoreboard", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("scoreboard", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("scoreboard", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("scoreboard", 255, 255, 255, 255)

        -- WarMenu.CreateSubMenu("recent", "scoreboard", "Recent D/C's")
        WarMenu.SetMenuWidth("recent", 0.5)
        WarMenu.SetTitleColor("recent", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("recent", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("recent", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("recent", 255, 255, 255, 255)

        WarMenu.CreateSubMenu("options", "scoreboard", "User Info")
        WarMenu.SetMenuWidth("options", 0.5)
        WarMenu.SetTitleColor("options", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("options", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("options", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("options", 255, 255, 255, 255)
    end

    Init()
    timed = 0
    while true do
        for k,v in pairs(NPC._Scoreboard.Menus) do
            if WarMenu.IsMenuOpened(k) then
                v()
                WarMenu.Display()
            else
                if timed > 0 then
                    timed = timed - 1
                end
            end
        end

        Citizen.Wait(1)
    end


end)

function NPC.Scoreboard.Menu.Open(self)
    NPC._Scoreboard.SelectedPlayer = nil
    WarMenu.OpenMenu("scoreboard")
end

function NPC.Scoreboard.Menu.Close(self)
    for k,v in pairs(NPC._Scoreboard.Menus) do
        WarMenu.CloseMenu(K)        shouldDraw =false    end
end

Controlkey = {["generalScoreboard"] = {303,"U"}} 
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
    Controlkey["generalScoreboard"] = table["generalScoreboard"]
end)

Citizen.CreateThread(function()
    local function IsAnyMenuOpen()
        for k,v in pairs(NPC._Scoreboard.Menus) do
            if WarMenu.IsMenuOpened(k) then return true end
        end

        return false
    end

    while true do
        Citizen.Wait(0)
        if IsControlPressed(0, Controlkey["generalScoreboard"][1]) then
            if not IsAnyMenuOpen() then
                NPC.Scoreboard.Menu:Open()
            end
        else
            if IsAnyMenuOpen() then NPC.Scoreboard.Menu:Close() end
            Citizen.Wait(100)
        end
    end
end)

RegisterNetEvent("npc-scoreboard:RemovePlayer")
AddEventHandler("npc-scoreboard:RemovePlayer", function(data)
    NPC.Scoreboard:RemovePlayer(data)
end)

RegisterNetEvent("npc-scoreboard:AddPlayer")
AddEventHandler("npc-scoreboard:AddPlayer", function(data)
    NPC.Scoreboard:AddPlayer(data)
end)

RegisterNetEvent("npc-scoreboard:RemoveRecent")
AddEventHandler("npc-scoreboard:RemoveRecent", function(src)
    NPC.Scoreboard:RemoveRecent(src)
end)

RegisterNetEvent("npc-scoreboard:AddAllPlayers")
AddEventHandler("npc-scoreboard:AddAllPlayers", function(data, recentData)
    NPC.Scoreboard:AddAllPlayers(data, recentData)
end)