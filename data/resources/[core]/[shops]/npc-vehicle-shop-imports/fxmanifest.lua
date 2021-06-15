fx_version 'cerulean'
games {'gta5'}

dependencies {
  "PolyZone",
  "npc-base"
}

server_script "vehshop_s.lua"

client_scripts {
    "@PolyZone/client.lua",
    "@npc-based-resources/client/errorlog.lua",
    "vehshop.lua"
  }