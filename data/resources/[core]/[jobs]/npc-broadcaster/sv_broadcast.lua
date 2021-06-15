RegisterServerEvent('attemptBroadcast')
AddEventHandler('attemptBroadcast', function()
    local src = source
    local user = exports["npc-base"]:getModule("Player"):GetUser(src)
    local jobs = exports["npc-base"]:getModule("JobManager")
    local jobs = exports["npc-base"]:getModule("JobManager"):CountJob("broadcaster")
    if activeBroadcast >= 5 then TriggerClientEvent("DoLongHudText",src, "There are already too many broadcasters here!",2) end
    jobs:SetJob(user, "broadcaster", false, function()
        TriggerClientEvent("broadcast:becomejob",src)
    end)
end)