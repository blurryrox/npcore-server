fx_version 'cerulean'
games { 'gta5' }

dependencies {
    "ghmattimysql",
    -- "yarn"
} 

files {
    'client/dist/index.html',
    'client/dist/js/app.js',
    'client/dist/css/app.css',
}
-- I started work on a server component in NodeJS, it's going to require
-- a lot more work tho...
client_script 'client/*.lua'
server_script {
    'server/*.lua',
    -- 'server/*.js'
}

ui_page 'client/dist/index.html'
