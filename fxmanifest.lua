fx_version 'cerulean'
game 'gta5'

author 'ghsxth'
description 'Mapas Connect'
version '1.0.0'
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
