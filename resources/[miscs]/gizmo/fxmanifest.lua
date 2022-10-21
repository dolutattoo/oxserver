fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

shared_script '@ox_lib/init.lua'

client_scripts {
	'client/**/*.ts',
	'client/**/*.js',
   	'client/**/*.lua'
}