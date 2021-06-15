fx_version "bodacious"
games { "gta5" }

files {
    'carvariations.meta',
    'carcols.meta'
}

data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'

client_script {
    'towlivery_names.lua'
}