RegisterServerEvent('error')
AddEventHandler('error',function(resource, args)

    sendToDiscord("```Error in "..resource..'```', args)
end)

function sendToDiscord(name, args, color)
    local connect = {
          {
              ["color"] = 16711680,
              ["title"] = "".. name .."",
              ["description"] = args,
              ["footer"] = {
              ["text"] = "NPC.FW",
              },
          }
      }
    PerformHttpRequest('https://discord.com/api/webhooks/851633366548873246/0rAZGq_rFQBADsRN-yz2P_ysFSzxjDB7nwb01YCq25zuzoiy9KjlIUDNr3300mIaMkht', function(err, text, headers) end, 'POST', json.encode({username = "[NPCore] Error Log:", embeds = connect, avatar_url = "https://cdn.discordapp.com/attachments/851633925624168479/851634078243094558/NPCore_Base_GH.png"}), { ['Content-Type'] = 'application/json' })
end
-- It must be saving into a file with io.open("test.lua", "r").