resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"
this_is_a_map 'yes'

client_script "@npc-based-resources/client/errorlog.lua"

client_script 'apart_client.lua'
client_script 'GUI.lua'
client_script 'hotel_client.lua'
client_script 'houserobberies_client.lua'
client_script 'safecracking.lua'
server_script 'apart_server.lua'
server_script 'hotel_server.lua'

ui_page 'index.html'

files {
  "index.html",
  "scripts.js",
  "css/style.css"
}