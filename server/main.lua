local ESX = exports['es_extended']:getSharedObject()

local ValidExtensions = {
    [".png"] = true,
    [".gif"] = true,
    [".jpg"] = true,
    ["jpeg"] = true
}

local ValidExtensionsText = '.png, .gif, .jpg, .jpeg'

ESX.RegisterUsableItem('printerdocument', function(source, item)
    TriggerClientEvent('esx-printer:client:UseDocument', source, item)
end)

ESX.RegisterCommand({'spawnprinter', 'sp'}, 'admin', function(xPlayer, args, showError)
	TriggerClientEvent('esx-printer:client:SpawnPrinter', xPlayer)
end, false, {help = _U('command_clear')})


RegisterNetEvent('esx-printer:server:SaveDocument', function(url)
    local xPlayer = ESX.GetPlayerFromId(source)
    local extension = string.sub(url, -4)
    local validexts = ValidExtensions
    if url ~= nil then
        if validexts[extension] then
            local info = {
                url = url
            }
            info.description = 'No name document'
            exports.ox_inventory:AddItem(source, 'printerdocument', 1, info)
        else
            xPlayer.showNotification('Thats not a valid extension, only '..ValidExtensionsText..' extension links are allowed.')
        end
    end
end)