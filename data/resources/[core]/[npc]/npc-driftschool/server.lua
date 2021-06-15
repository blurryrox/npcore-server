RegisterServerEvent('npc-driftschool:takemoney')
AddEventHandler('npc-driftschool:takemoney', function(data)
    local src = source
    local user = exports["npc-base"]:getModule("Player"):GetUser(source)

	if user:getCash() >= data then
        user:removeMoney(data)
    TriggerClientEvent('npc-driftschool:tookmoney', source, true)
    else
        TriggerClientEvent('DoLongHudText', source, 'You do not have enough money to do that.', 2)
    end
end)


