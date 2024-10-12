RegisterNetEvent('vapeCheckAdminPermission')
AddEventHandler('vapeCheckAdminPermission', function(targetPlayer, message)
    local _source = source  
    print("Vérification des permissions pour le joueur ID: " .. _source)

    if IsPlayerAceAllowed(_source, 'command.msgadmin') then
        print("Le joueur ID: " .. _source .. " est un admin.")
        if GetPlayerName(targetPlayer) then
            TriggerClientEvent('vapeSendMessage', targetPlayer, message)
            TriggerClientEvent('vapeSendMessage', _source, "Le message a bien été envoyé à l'ID " .. targetPlayer)
        else
            TriggerClientEvent('vapeSendMessage', _source, "Le joueur ciblé n'est pas connecté")
        end
    else
        print("Le joueur ID: " .. _source .. " n'est pas un admin.")
        TriggerClientEvent('vapeNoPermission', _source)
    end
end)
