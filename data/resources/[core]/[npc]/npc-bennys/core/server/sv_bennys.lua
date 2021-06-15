local koil = vehicleBaseRepairCost

RegisterServerEvent('npc-bennys:attemptPurchase')
AddEventHandler('npc-bennys:attemptPurchase', function(cheap, type, upgradeLevel)
	local src = source
	local user = exports["npc-base"]:getModule("Player"):GetUser(src)
    if type == "repair" then
        if user:getCash() >= koil then
            user:removeMoney(koil)
            TriggerClientEvent('npc-bennys:purchaseSuccessful', source)
        else
            TriggerClientEvent('npc-bennys:purchaseFailed', source)
        end
    elseif type == "performance" then
        if user:getCash() >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('npc-bennys:purchaseSuccessful', source)
            user:removeMoney(vehicleCustomisationPrices[type].prices[upgradeLevel])
        else
            TriggerClientEvent('npc-bennys:purchaseFailed', source)
        end
    else
        if user:getCash() >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('npc-bennys:purchaseSuccessful', source)
            user:removeMoney(vehicleCustomisationPrices[type].price)
        else
            TriggerClientEvent('npc-bennys:purchaseFailed', source)
        end
    end
end)

RegisterServerEvent('npc-bennys:updateRepairCost')
AddEventHandler('npc-bennys:updateRepairCost', function(cost)
    koil = cost
end)
