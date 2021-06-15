fx_version 'cerulean'
games {'gta5'}

client_script "@npc-based-resources/client/errorlog.lua"

client_script {
  "gui.lua",
  "cl_pogarage.lua"
}
server_script "sv_pogarage.lua"
