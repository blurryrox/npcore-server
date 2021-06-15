fx_version 'cerulean'
games { 'gta5' }

client_script "@npc-based-resources/client/errorlog.lua"

ui_page 'index.html'

files {
  "index.html",
  "scripts.js",
  "css/style.css"
}
client_script {
  "client.lua",
}

export "taskBar"
export "closeGuiFail"