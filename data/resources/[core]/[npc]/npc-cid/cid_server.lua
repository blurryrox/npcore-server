RegisterServerEvent('npc-cid:createID')
AddEventHandler('npc-cid:createID', function(first, last, job, sex, dob)
    print("yeah I got triggered...")
    information = {
        ["identifier"] = math.random(1,999),
        ["Name"] = tostring(first),
        ["Surname"] = tostring(last),
        ["Sex"] = tostring(sex),
        ["DOB"] = tostring(dob),
    }
    TriggerClientEvent("player:receiveItem", source,"idcard",1,true,information)
end)