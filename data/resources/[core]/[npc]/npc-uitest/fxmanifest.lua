fx_version 'cerulean'
games {'gta5'}

client_script "@npc-based-resources/client/errorlog.lua"

client_script('client/client.lua')

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/script.js',
    'client/html/style.css',
    'client/html/cursor.png',
    'client/html/menuButton.png',
    'client/html/menuButtonJudge.png',
    'client/html/menuButtonEms.png',
    'client/html/menuButtonPolice.png'
})