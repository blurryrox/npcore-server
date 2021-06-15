fx_version 'cerulean'
games {'gta5'}

--resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script "@npc-based-resources/client/errorlog.lua"


client_script {
  "client.lua",
}
export "GetClosestNPC"
export "IsPedNearCoords"
export "isPed"
export "GroupRank"
export "GlobalObject"
export "retreiveBusinesses"