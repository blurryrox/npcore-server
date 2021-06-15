games {'gta5'}

fx_version 'cerulean'

ui_page "core/client/ui/html/index.html"

files 
{
    "core/client/ui/html/index.html",
    "core/client/ui/html/css/menu.css",
    "core/client/ui/html/js/ui.js",
    "core/client/ui/html/imgs/logo.png",
    "core/client/ui/html/sounds/wrench.ogg",
    "core/client/ui/html/sounds/respray.ogg"
}

client_scripts
{
    "core/_config/cfg_vehicleCustomisation.lua",
    "core/client/ui/cl_ui.lua",
    "core/client/cl_bennys.lua"
}

server_scripts
{
    "core/_config/cfg_vehicleCustomisation.lua",
    "core/server/sv_bennys.lua"
}
