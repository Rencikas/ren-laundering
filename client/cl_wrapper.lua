Core = nil

SetupCoreObject = function()
    if Laundering.Core.Target == 'qb-core' then 
        Core = exports['qb-core']:GetCoreObject()
    elseif Laundering.Core.Target == 'ox_core' then 
        
    elseif Laundering.Core.Target == 'esx' then 
        Core = exports['es_extended']:getSharedObject()
    end
end

AddTarget = function(entity, data)
    if Laundering.Core.Target == 'qb-target' then 
        exports['qb-target']:AddTargetEntity(entity, {
            options = data,
            distance = 2
        })
    elseif Laundering.Core.Target == 'ox_target' then 
        exports.ox_target:addEntity(entity, data)
    elseif Laundering.Core.Target == 'qtarget' then 
        exports.qtarget:AddTargetEntity(entity, {
            options = data,
            distance = 2
        })
    end
end

TriggerCallBack = function(name, data, cb)
    if Laundering.Core.Target == 'qb-core' then 
        Core.Functions.TriggerCallback(name, function(result)
            cb(result)
        end)
    elseif Laundering.Core.Target == 'ox_core' then 
        local result = lib.callback.await(name, data)
        cb(result)
    elseif Laundering.Core.Target == 'esx' then 
        Core.TriggerServerCallback(name, function(result)
            cb(result)
        end)   
    end
end