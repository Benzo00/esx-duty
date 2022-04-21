fx_version 'bodacious'
game 'gta5'

author 'Benzo#6565'
description 'Duty Script'

shared_scripts  {
	'@es_extended/imports.lua',
	'shared/*.lua'
}

client_scripts { 'client/*.lua' }
server_scripts { 'server/*.lua' }

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/nui.js',
    'nui/img/*.png'
}
