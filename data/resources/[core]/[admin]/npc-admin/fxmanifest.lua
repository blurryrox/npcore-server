fx_version 'cerulean'
games {'gta5'}

dependency "npc-base"
dependency "ghmattimysql"

client_script "@npc-based-resources/client/errorlog.lua"
client_script "@warmenu/warmenu.lua"

client_script "@npc-infinity/client/cl_lib.lua"
server_script "@npc-infinity/server/sv_lib.lua"

ui_page "html/index.html"

files({
    "html/index.html",
    "html/script.js",
    "html/styles.css"
})

server_script "shared/sh_admin.lua"
server_script "shared/sh_commands.lua"
server_script "shared/sh_ranks.lua"

client_script "shared/sh_admin.lua"

client_script "client/cl_menu.lua"
client_script "client/cl_noclip.lua"

client_script "shared/sh_commands.lua"
client_script "shared/sh_ranks.lua"

server_script "server.lua"
server_script "server/sv_db.lua"
server_script "server/sv_admin.lua"

client_script "client/cl_admin.lua"
