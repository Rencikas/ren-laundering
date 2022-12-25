Core = { Target = 'qtarget', Core = 'esx' }

Laundering = {
    [1] = {
        Data = {
            CleanMoney = false,--// if CleanMoney = false means that it will not clean money but will clean items
            ShowBlip = true,--// if left true it will display dealers blip on the map
        },
        Types = {
            ['item'] = {
                itemName = 'phone',
                itemWorth = 5000
            },
            ['money'] = {
                account = 'cash',
                worth = 5000
            }
        },
        Dealer = {
            model = 's_m_y_dealer_01',
            pos = vec3(559.4, -1777.36, 32.50),
            heading = 339.78,
        }
    }
}