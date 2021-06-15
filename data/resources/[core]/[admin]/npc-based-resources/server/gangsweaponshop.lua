RegisterServerEvent('CheckMoneyForWeaGang')
AddEventHandler('CheckMoneyForWeaGang', function()

    TriggerClientEvent('FinishMoneyCheckForWeaGang', source)
end)