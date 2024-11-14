fx_version 'cerulean'
game 'gta5'

author 'ghsxth'
description 'Mapas Connect'
version '1.0.4 - Update Natal'
lua54 'yes'

this_is_a_map 'yes'

ghsxth 'ghsxth.tebex.io'
Outside 'https://linktr.ee/outsidegg'

dependencies { 
    '/server:4960',     -- ⚠️ATENÇÃO⚠️; Necessário utilizar o SERVER build 4960 ou superior.
    '/gameBuild:2545',  -- ⚠️ATENÇÃO⚠️; Necessário utilizar GAME build 2545 ou superior.
}

files {
    'stream/*',
    'stream/**/*',
    'stream/brnxcinema/[interiorproxies]/interiorproxies.meta',
    'stream/connectvanilla/[interiorproxies]/interiorproxies.meta',
    'stream/brnxcinema/[audio]/brnx_cinema_col_game.dat151.rel',
    'stream/brnxcinema/[audio]/brnx_cinema_col_mix.dat15.rel',
}

client_scripts {
    'client-side/ghsxth_peds_blockers.lua',
}

server_scripts {
    'version_check.lua',
}

escrow_ignore {
    'stream/**/*.ytd',
    'client-side/ghsxth_peds_blockers.lua',
}

data_file 'AUDIO_GAMEDATA' 'stream/brnxcinema/[audio]/brnx_cinema_col_game.dat151'
data_file 'AUDIO_DYNAMIXDATA' 'stream/brnxcinema/[audio]/brnx_cinema_col_mix.dat15'

data_file 'INTERIOR_PROXY_ORDER_FILE' 'stream/connectvanilla/[interiorproxies]/interiorproxies.meta'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'stream/brnxcinema/[interiorproxies]/interiorproxies.meta'
dependency '/assetpacks'