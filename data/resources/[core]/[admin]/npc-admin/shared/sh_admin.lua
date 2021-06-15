NPC = NPC or {}
NPC.Admin = NPC.Admin or {}
NPC.Admin.DB = {}
NPC._Admin = NPC._Admin or {}
NPC._Admin.Ranks = {}
NPC._Admin.Commands = {}
NPC._Admin.Players = {}
NPC._Admin.DiscPlayers = {}
NPC._Admin.CurAdmins = {}

function NPC.Admin.Log(self, log, user)
    if not log or not tostring(log) then return else log = tostring(log) end

    if IsDuplicityVersion() then
        local time = os.date("%x - %I:%M:%S")
        log = string.format("%s - ADMIN: %s", time, log)

        print(log)

        exports["npc-based-resources"]:AddLog("Admin", user and user or false, log, false)

        return
    end

    log = string.format( "ADMIN: %s", log)
    print(log)
end

function NPC.Admin.ChatPrint(self, msg, target)

end

function NPC.Admin.RankExists(self, rank)
    rank = tostring(rank)
    if not rank then return false end

    return self:GetRanks()[rank] and true or false
end

function NPC.Admin.CommandExists(self, cmd)
    cmd = tostring(cmd)
    if not cmd then return false end

    return self:GetCommandData(cmd) ~= false
end

function NPC.Admin.RankInheritsCommand(self, rank, cmd)
    if not rank or not self:RankExists(rank) then return end
    if not cmd or not self:CommandExists(cmd) then return end

    local cmdinfo = self:GetCommandData(cmd)
    local rankinfo = self:GetRankData(rank)

    for k,v in pairs(cmdinfo.ranks) do
        if v == rankinfo.inherits or v == rankinfo.rank then return true end
    end

    while rankinfo.inherits ~= "" do
        rankinfo = self:GetRankData(rankinfo.inherits)
        for k,v in pairs(cmdinfo.ranks) do
            if v == rankinfo.rank or v == rankinfo.inherits then return true end
        end
    end

    return false
end

function NPC.Admin.GetPlayerRank(self, user)
    if not IsDuplicityVersion() then
        return exports["npc-base"]:getModule("LocalPlayer"):getVar("rank")
    else
        if not user then return false end

        local rank = user:getVar("rank")
        return rank and rank or false
    end
end

function NPC.Admin.RankHasCommand(self, rank, cmd)
    if not rank or not cmd then return false end

    if not self:RankExists(rank) then return false end
    if not self:CommandExists(cmd) then return false end

    local cmdInfo = self:GetCommandData(cmd)
    
    for k,v in ipairs(cmdInfo.ranks) do
        if v == rank then
            return true
        end
    end

    return self:RankInheritsCommand(rank, cmd)
end

function NPC.Admin.GetRanks(self)
    return NPC._Admin.Ranks
end

function NPC.Admin.GetRankData(self, rank)
    if not rank then return false end

    rank = tostring(rank)
    if not rank then return false end

    return self:GetRanks()[rank] and self:GetRanks()[rank] or false
end

function NPC.Admin.GetCommands(self)
    return NPC._Admin.Commands
end

function NPC.Admin.GetCategories(self)
    local tmp = {}
    for k, v in pairs(self:GetCommands()) do
        tmp[v.category] = true
    end

    return tmp
end

function NPC.Admin.GetCommandData(self, cmd)
    if not cmd then return false end

    cmd = tostring(cmd)
    if not cmd then return false end

    return self:GetCommands()[cmd] and self:GetCommands()[cmd] or false
end

function NPC.Admin.IsAdmin(self, user)
    if not user then return false end
    if not self:GetPlayerRank(user) then return false end
    if not self:RankExists(self:GetPlayerRank(user)) then return false end

    local rank = self:GetRankData(self:GetPlayerRank(user))
    return rank.isadmin or rank.issuperadmin and true or false
end

function NPC.Admin.IsSuperAdmin(self, user)
    if not IsDuplicityVersion() then
        local rank = self:GetRankData(self:GetPlayerRank())
        return rank.issuperadmin and true or false
    end

    if not user then return false end
    if not self:GetPlayerRank(user) then return false end
    if not self:RankExists(self:GetPlayerRank(user)) then return false end

    local rank = self:GetRankData(self:GetPlayerRank(user))
    return rank.issuperadmin and true or false
end

function NPC.Admin.IsValidUser(self, user)
    if not user then return false end
    
    local rank = self:GetPlayerRank(user)
    if not rank then return false end

    if not self:RankExists(rank) then return false end

    local steamid = user:getVar("steamid")
    local license = user:getVar("license")
    local src = user:getVar("source")

    if not steamid or not license or not src then return false end

    local util = exports["npc-base"]:getModule("Util")
    if not util:IsSteamId(steamid) then return false end

    return true
end

function NPC.Admin.CanTarget(self, user, target)
    if not self:IsValidUser(user) or not self:IsValidUser(target) then return end

    local cRank = self:GetPlayerRank(user)
    local tRank = self:GetPlayerRank(target)

    cRank = self:GetRankData(cRank)
    tRank = self:GetRankData(tRank)

    return cRank.grant >= tRank.grant
end

function NPC.Admin.CanTargetRank(self, user, rank)
    local rank = tostring(rank)
    if not rank then return false end
    
    rank = string.lower(rank)

    if not self:IsValidUser(user) or not self:RankExists(rank) then return false end

    local cRank = self:GetPlayerRank(user)
    cRank = self:GetRankData(cRank)

    local tRank = self:GetRankData(rank)

    return cRank.grant >= tRank.grant
end

function NPC.Admin.AddCommand(self, cmd)
    local tmp = {}
    local name = cmd.command

    if cmd.command == nil then return end

    tmp = {
        title = cmd.title or "Unknown",
        command = cmd.command,
        concmd = cmd.concmd or cmd.command,
        category = cmd.category or "No category",
        usage = cmd.usage or "No usage example",
        description = cmd.description or "No description",
        ranks = cmd.ranks or {},
        init = cmd.Init or function() return end,
        chatcommand = cmd.ChatCommand or function() return end,
        drawcommand = cmd.DrawCommand or function() return end
    }

    if IsDuplicityVersion() then
        tmp.runcommand = cmd.RunCommand
    else
        tmp.runcommand = function(args) args.command = tmp.command NPC.Admin:RunCommand(args) end
        tmp.runclcommand = function(args)
            if not cmd.RunClCommand then return end

            local rank = NPC.Admin:GetPlayerRank()
            if not rank then return false end

            if not self:RankHasCommand(rank, tmp.command) then return false end

            cmd.RunClCommand(args)
        end
    end

    if tmp.init and type(tmp.init) == "function" then tmp.init() end

    self:GetCommands()[name] = tmp
end

function NPC.Admin.AddRank(self, rank, data)
    local tmp = {}

    tmp = {
        name = rank,
        inherits = data.inherits or "",
        displayname = data.displayname or "",
        issuperadmin = data.issuperadmin or false,
        allowafk = data.allowafk or false,
        isadmin = data.isadmin or false,
        grant = data.grant or 1,
        inheritedcommands = {}
    }

    self:GetRanks()[rank] = tmp
end

function NPC.Admin.GetBanTimeFromString(self, time)
    if not time or not type(time) == "string" then return end

    if time == "0" then
        return 0
    end

    local times = {
        ["m"] = {text = "Minute(s)", time = 0},
        ["h"] = {text = "Hour(s)", time = 0},
        ["d"] = {text = "Day(s)", time = 0},
        ["w"] = {text = "Week(s)", time = 0},
        ["M"] = {text = "Month(s)", time = 0},
        ["y"] = {text = "Year(s)", time = 0}
    }

    local temp = {}
    local timeSum = 0

    for i = 1, #time do
        local l = time:sub(i, i)
        if not tonumber(l) then
            if not times[l] then return false, false, false end
        end
    end

    local l = string.match(time, "%a+")
    if not l then return false, false, false end

    for k,v in pairs(times) do
        local s = string.match(time, "[%d+]?" .. k)

        if s then
            local t = tonumber(string.match(s, "%d+"))

            if not t or t < 0 then return false, false, false end

            times[k].time = t

            if k == "m" then
                timeSum = timeSum + (t * 60)
            elseif k == "h" then
                timeSum = timeSum + (t * 3600)
            elseif k == "d" then
                timeSum = timeSum + (t * 86400)
            elseif k == "w" then
                timeSum = timeSum + (t * 604800)
            elseif k == "M" then
                timeSum = timeSum + (t * 2629746)
            elseif k == "y" then
                timeSum = timeSum + (t * 31556952)
            end
        end
    end

    if IsDuplicityVersion() then
        local curTime = os.time()
        addedTime = timeSum + curTime
    else
        addedTime = false
    end

    local temp = {}

    for k,v in pairs(times) do
        if v.time > 0 then
            temp[k] = v
        end
    end

    return temp, timeSum, addedTime
end

function NPC.Admin.SetStatus(self, status, src)
    status = tostring(status)
    if not status then return end

    if IsDuplicityVersion() then
        if not src then return end

        local player = NPC._Admin.Players[src]
        if not player then else NPC._Admin.Players[src].status = status end

        for k,v in pairs(NPC._Admin.CurAdmins) do
            TriggerClientEvent("npc-admin:setStatus", k, src, status)
        end

        return
    end

    TriggerServerEvent("npc-admin:setStatus", status)
end

function NPC.Admin.DumpCurrentPlayers(self)
    TriggerServerEvent("admin:dumpCurrentPlayers",NPC._Admin.Players,NPC._Admin.DiscPlayers)
end

AddEventHandler("npc-base:exportsReady", function()
    exports["npc-base"]:addModule("Admin", NPC.Admin)
    exports["npc-base"]:addModule("_Admin", NPC._Admin)
end)