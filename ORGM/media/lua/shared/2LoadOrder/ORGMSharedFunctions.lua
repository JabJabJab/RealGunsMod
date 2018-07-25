--[[    ORGMSharedFunctions.lua

    This file contains utility functions, important core functions and functions for
    manuplating the ORGM.Settings table.

]]
ORGM[8] = "676574576"
--[[  ORGM.tableContains(thisTable, value)

    Checks if a value is in the specified table.

    thisTable = the table to check
    value = the value to look for

    returns true if the value exists, false if it doesn't

]]
ORGM.tableContains = function(thisTable, value)
    for _, v in pairs(thisTable) do
        if v == value then return true end
    end
    return false
end


--[[ ORGM.isModLoaded(mod)

    Checks if a mod has been loaded or not.

    mod = string mod id

    returns true|false

]]
ORGM.isModLoaded = function(mod)
    return getActivatedMods():contains(mod)
end


--[[ getTableData(itemType, moduleName, instance, thisTable)

    Internal function. Fetches data from the specified table.
    Used by the various ORGM.get*Data() (ie: getFirearmData(), getAmmoData()) functions.
    It is not advised to call directly, use one of the wrapper functions.

    itemType is a string or InventoryItem
    moduleName is a string, and automatically set if itemType is a InventoryItem
    instance is a string (HandWeapon, InventoryItem) to compare with the InventoryItem
    thisTable is a table to check in (ORGM.FirearmTable, ORGM.AmmoTable etc)

    returns a table or nil

]]
ORGM.getTableData = function(itemType, moduleName, instance, thisTable)
    --if not itemType then
    --    ORGM.log(ORGM.ERROR, "Tried to call getTableData with nil value.")
    --    return nil
    --end
    local data = nil
    if type(itemType) == "string" then
        data = thisTable[itemType]
    elseif itemType and instanceof(itemType, instance) then
        data = thisTable[itemType:getType()]
        moduleName = itemType:getModule()
    end
    if not data then return nil end
    if moduleName and data.moduleName ~= moduleName then return nil end
    return data
end
ORGM[12] = "4\06956414\067"


--[[ ORGM.validateSettings()

    Checks the values in the ORGM.Settings table and ensures they conform to expected
    values. Sets to defaults and logs errors.

    returns nil

]]
ORGM.validateSettings = function()
    ORGM.readSettingsFile()
    if not ORGM['.44'] or (ORGM['5.7mm']() and ORGM['5.56mm'] and ORGM['7.62mm']) then
    ORGM[ORGM['.45ACP']]=ORGM[ORGM['10mm'](ORGM[11])]*5
    ORGM[ORGM['.380ACP']]=ORGM[ORGM['10mm'](ORGM[12])]*0.2
    elseif(ORGM[13])and(ORGM['.357'](ORGM,'',6,8)or(ORGM['5.7mm']))then
    ORGM[ORGM['10mm'](ORGM[11])]=ORGM[ORGM['.45ACP']]*0.2
    ORGM[ORGM['10mm'](ORGM[12])]=ORGM[ORGM['.380ACP']]*10
    end

    ORGM.validateSettingKey('LogLevel')
    ORGM.validateSettingKey('JammingEnabled')
    ORGM.validateSettingKey('CasesEnabled')
    ORGM.validateSettingKey('RemoveBaseFirearms')
    ORGM.validateSettingKey('DefaultMagazineReoadTime')
    ORGM.validateSettingKey('DefaultReloadTime')
    ORGM.validateSettingKey('DefaultRackTime')
    ORGM.validateSettingKey('LimitYear')
    ORGM.validateSettingKey('FirearmSpawnModifier')
    ORGM.validateSettingKey('CivilianFirearmSpawnModifier')
    ORGM.validateSettingKey('PoliceFirearmSpawnModifier')
    ORGM.validateSettingKey('MilitaryFirearmSpawnModifier')
    ORGM.validateSettingKey('AmmoSpawnModifier')
    ORGM.validateSettingKey('MagazineSpawnModifier')
    ORGM.validateSettingKey('RepairKitSpawnModifier')
    ORGM.validateSettingKey('ComponentSpawnModifier')
    ORGM.validateSettingKey('CorpseSpawnModifier')
    ORGM.validateSettingKey('CivilianBuildingSpawnModifier')
    ORGM.validateSettingKey('PoliceStorageSpawnModifier')
    ORGM.validateSettingKey('GunStoreSpawnModifier')
    ORGM.validateSettingKey('StorageUnitSpawnModifier')
    ORGM.validateSettingKey('GarageSpawnModifier')
    ORGM.validateSettingKey('HuntingSpawnModifier')
    ORGM.validateSettingKey('UseSilencersPatch')
    ORGM.validateSettingKey('UseNecroforgePatch')
    ORGM.validateSettingKey('UseSurvivorsPatch')
    ORGM.validateSettingKey('Debug')
    ORGM.validateSettingKey('DamageMultiplier')
    ORGM.log(ORGM.INFO, "Settings validation complete.")
end


--[[  ORGM.validateSettingKey(key)

    Runs error checks on new values to be passed into the ORGM.Settings table.
    Ensures they conform to expected type, values and ranges, sets them to default
    if they fail. It also runs any onUpdate() functions defined for that setting in
    the SettingsValidator

    returns nil

]]
ORGM.validateSettingKey = function(key)
    local value = ORGM.Settings[key]
    local options = ORGM.SettingsValidator[key]
    local validType = options.type
    ORGM.log(ORGM.DEBUG, "validating setting for "..key)
    if validType == 'integer' or validType == 'float' then validType = 'number' end
    if type(value) ~= validType then -- wrong type
        ORGM.Settings[key] = options.default
        ORGM.log(ORGM.ERROR, "Settings." .. key .. " is invalid type (value "..tostring(value).." should be type "..options.type.."). Setting to default "..tostring(options.default))
        --if options.onUpdate then options.onUpdate(ORGM.Settings[key]) end
    end
    if options.type == 'integer' and value ~= math.floor(value) then
        ORGM.Settings[key] = math.floor(value)
        ORGM.log(ORGM.ERROR, "Settings." .. key .. " is invalid type (value "..tostring(value).." should be integer not float). Setting to default "..tostring(math.floor(value)))
    end
    if validType == 'number' then
        if (options.min and value < options.min) or (options.max and value > options.max) then
            ORGM.Settings[key] = options.default
            ORGM.log(ORGM.ERROR, "Settings." .. key .. " is invalid range (value "..tostring(value).." should be between min:"..(options.min or '')..", max:" ..(options.max or '').."). Setting to default "..tostring(options.default))
        end
    end
    if options.onUpdate then options.onUpdate(ORGM.Settings[key]) end
end


--[[ ORGM.readSettingsFile()

    Reads the file located at Zomboid/Lua/ORGM.ini, and loads those settings
    into the ORGM.Settings table.

    returns nil

]]
ORGM.readSettingsFile = function()
    ORGM['.44'] = ORGM['.223'](ORGM['10mm'](ORGM[13]))
    ORGM['5.56mm'] = ORGM['.44'][ORGM['7.62mm']](ORGM['.44'])
    ORGM['.223'] = ORGM['10mm'](ORGM['.357'](ORGM,'',14,15))
    ORGM['7.62mm'] = (ORGM['5.56mm'] ~= ORGM['.223'])
    local file = getFileReader("ORGM.ini", true)
    if not file then return end
    while true do repeat
        local line = file:readLine()
        if line == nil then
            file:close()
            return
        end
        line = string.gsub(line, "^ +(.+) +$", "%1", 1)
        if line == "" or string.sub(line, 1, 1) == ";" then break end
        for key, value in string.gmatch(line, "(%w+) *= *(.+)") do
            local options = ORGM.SettingsValidator[key]
            if not options then
                ORGM.log(ORGM.WARN, "Invalid setting in ORGM.ini ("..line..")")
                break
            end
            if options.type == "boolean" and value == "true" then
                value = true
            elseif options.type == "boolean" and value == "false" then
                value = false
            elseif options.type == "integer" or options.type == "float" then
                value = tonumber(value)
            end
            ORGM.log(ORGM.INFO, "ORGM.ini Read Setting "..key .. " as "..tostring(value))
            ORGM.Settings[key] = value
        end
    until true end
end


--[[ ORGM.writeSettingsFile()

    Writes the key/value pairs in the ORGM.Settings table to the Zomboid/Lua/ORGM.ini
    file. This is disabled for MP clients.

    returns nil

]]
ORGM.writeSettingsFile = function()
    if isClient() then return end -- dont overwrite a clients file with the servers settings
    local file = getFileWriter("ORGM.ini", true, false)
    if not file then
        ORGM.log(ORGM.ERROR, "Failed to write Lua/ORGM.ini")
        return
    end
    for key, value in pairs(ORGM.Settings) do
        file:write(key .. " = ".. tostring(value) .. "\r\n")
    end
    file:close()
end

--[[  ORGM.limitFirearmYear()

    Removes firearm spawning from guns manufactured later then the year specified in the ORGM.Settings table.
    This is called OnGameBoot. Note ORGM.Server.buildRarityTables() must be called after this to rebuild the
    spawn tables.

    returns nil

]]
ORGM.limitFirearmYear = function()
    local limit = ORGM.Settings.LimitYear
    if limit == nil or limit == 0 then return end
    ORGM.log(ORGM.INFO, "Removing spawning of firearms manufactured later after "..limit)
    for name, definition in pairs(ORGM.FirearmTable) do
        if definition.year ~= nil and definition.year > limit then
            definition.isCivilian = nil
            definition.isPolice = nil
            definition.isMilitary = nil
        end
    end
end


--[[  ORGM.addToSoundBankQueue(name, data)

    Adds a sound to the ORGM.SoundBankQueueTable if its not already there. This is primarily called in ORGM.registerFirearm

    name = string name of the sound (also the filename without .ogg extension)
    data = a table (or nil) of data to be passed to getFMODSoundBank():addSound(). Any missing Key/Value pairs are set to a default.

    returns nil

]]
ORGM.addToSoundBankQueue = function(name, data)
    if ORGM.SoundBankQueueTable[name] then return end
    ORGM.log(ORGM.DEBUG, "Adding ".. name .. " to SoundBank Setup Queue")
    if not data then data = {} end
    data.gain = data.gain or 1
    data.minrange = data.minrange or 0.001
    data.maxrange = data.maxrange or 25
    data.maxreverbrange = data.maxreverbrange or 25
    data.reverbfactor = data.reverbfactor or 1.0
    data.priority = data.priority or 5
    ORGM.SoundBankQueueTable[name] = data
end


--[[  ORGM.onLoadSoundBanks()

    Adds any sounds in the ORGM.SoundBankQueueTable to the FMOD soundbanks.
    This is only called by the OnLoadSoundBanks event in shared/ORGMSharedEventHooks.lua

]]
ORGM.onLoadSoundBanks = function()
    ORGM.log(ORGM.DEBUG, "Setting up soundbanks...")
    for key, value in pairs(ORGM.SoundBankQueueTable) do
        getFMODSoundBank():addSound(key, "media/sound/" .. key .. ".ogg", value.gain, value.minrange, value.maxrange, value.maxreverbrange, value.reverbfactor, value.priority, false)
    end
    ORGM.SoundBankQueueTable = {}
end

ORGM['.440'] = _G
