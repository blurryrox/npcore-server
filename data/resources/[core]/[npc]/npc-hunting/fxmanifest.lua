fx_version 'cerulean'
games { 'gta5' }

--[[ dependencies {
  "npc-lib",
  "PolyZone",
  "npc-ui"
} ]]--

client_script "@npc-sync/client/lib.lua"
client_script "@npc-lib/client/cl_ui.lua"

client_scripts {
  '@npc-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
  "@PolyZone/client.lua",
}

shared_script {
  '@npc-lib/shared/sh_util.lua',
  'shared/sh_*.*',
}

server_scripts {
  '@npc-lib/server/sv_rpc.lua',
  '@npc-lib/server/sv_sql.lua',
  'server/sv_*.lua',
  'server/sv_*.js',
}
