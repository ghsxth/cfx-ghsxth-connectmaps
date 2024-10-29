local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/ghsxth/cfx-ghsxth-binco/master/version', function(err, newestVersion, headers)
    	local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
        local resourcename = "cfx-ghsxth-binco"
        local howto = "^7procure o criador para obter a ^2versão mais recente^1!\n^1----------------------------------------------------------------------------"
    	if not newestVersion then 
            print("^7Não foi possível verificar a versão do seu asset!") 
            return 
        end

    	local advice = "^7Você está utilizando uma versão desatualizada do asset "..resourcename.."\n"..howto.." ^7"
    	if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") 
        then advice = "^2----------------------------------------------------------------------------\n^3[GHSXTH]^7 "..resourcename.." os assets estão utilizando a versão mais recente.\n^2----------------------------------------------------------------------------"
        else 
            print("^1----------------------------------------------------------------------------")
            print("")
            print("^1[ATENÇÃO!]")
            print("")
            print("^3[GHSXTH]^7: ^1Versão atual:^7: "..currentVersion.." ^2Versão mais recente:^7: "..newestVersion)
            print("")
            print("")
        end
    	print(advice)
    end)
end
CheckVersion()

Config = {}

Config.hook = 'https://discord.com/api/webhooks/1300909606616305665/dad9uP_XMRSVOb9cnEP4CsI0tvWptTC0ernqeVONl6usE3Brnm38WwN65sB6udgNFwdZ'

Config.loginLog = true
Config.loginLogLink = 'https://discord.com/api/webhooks/1300909674291531838/yYfgDmHkl5j6_M4judJT1ga4lv80Xq9LEKTh9nj-tWFbC8O1XowwTI8Ag1_u1ItVdtzg'


Config.name = 'Connect Maps'
Config.logo = ''

function SendWebHook(hook, title, color, message)
    local embedMsg = {}
    timestamp = os.date("%c")
    embedMsg = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] =  ""..message.."",
            ["footer"] ={
                ["text"] = timestamp.." (Servidor).",
            },
        }
    }
    PerformHttpRequest(hook,
    function(err, text, headers)end, 'POST', json.encode({username = Config.name, avatar_url= Config.logo ,embeds = embedMsg}), { ['Content-Type']= 'application/json' })
end


AddEventHandler('ghsxth:sendWebhook', function(data)
    if data.link == nil then
        hook = Config.hook
    else
        hook = data.link
    end
    title = data.title
    color = data.color
    message = data.message
    SendWebHook(hook, title, color, message)
end)

Citizen.CreateThread(function()
    if Config.loginLog then
        if Config.loginLogLink == '' then

        else
        AddEventHandler('playerJoining', function()
            local id = source
            local ids = GetPlayerIdentifier(id, steam)
            local plyName = GetPlayerName(id)
            local data = {
                link = Config.loginLogLink,
                title = plyName.." entrando no servidor.",
                color = 655104,
                message = 
                '**[Usuário]: **'..plyName..'\n'..
                '**[Identificador]: **'..ids..'\n'..
                '**[ID de sessão]: **'..id..'\n'
            }
            TriggerEvent('ghsxth:sendWebhook', data)
        end)

        AddEventHandler('playerDropped', function(reason)
            local id = source
            local ids = GetPlayerIdentifier(id, steam)
            local plyName = GetPlayerName(id)
            local reason = reason
            local data = {
                link = Config.loginLogLink,
                title = plyName.." saindo do servidor.",
                color = 16711689,
                message = 
                '**[Usuário]: **'..plyName..'\n'..
                '**[Identificador]: **'..ids..'\n'..
                '**[Motivo]: **'..reason..'\n'
            }
            TriggerEvent('ghsxth:sendWebhook', data)
        end)
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    resName = GetCurrentResourceName()
    if resource == resName then
        if Config.hook == '' then

        else
            local data = {
                link = Config.hook,
                title = "ghsxth logger",
                color = 4521728,
                message = 
                '**'..resName..'** foi iniciado com sucesso.'
            }
            TriggerEvent('ghsxth:sendWebhook', data)
        end
    end
end)