Core = nil

SetupCoreObject = function()
    if Laundering.Core.Target == 'qb-core' then 
        Core = exports['qb-core']:GetCoreObject()
    elseif Laundering.Core.Target == 'ox_core' then 
        
    elseif Laundering.Core.Target == 'esx' then 
        Core = exports['es_extended']:getSharedObject()
    end
end

RegisterCallBack = function()
    if Laundering.Core.Target == 'qb-core' then 
        Core.Functions.TriggerCallback(name, function(result)
            cb(result)
        end)
    elseif Laundering.Core.Target == 'ox_core' then 
        local result = lib.callback.await(name, data)
        cb(result)
    elseif Laundering.Core.Target == 'esx' then 
        ESX.RegisterServerCallback(name, function(source, cb)
            cb(server)
        end)
    end
end