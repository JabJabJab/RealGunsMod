--[[- Various Client Fuctions

    @module ORGM.Client
    @release v3.09
    @author Fenris_Wolf
    @copyright 2018 **File:** client/1LoadOrder/ORGMClient.lua

]]

local ORGM = ORGM
local Client = ORGM.Client
local Firearm = ORGM.Firearm
local loadStaticZomboidModel = loadStaticZomboidModel

--[[- Loads a 3d model. Trigged by OnGameBoot event in `ORGMClientEvents.lua`

@tparam string name the name alias for the model
@tparam[opt] string model the file name. defaults to the name argument if nil.
@tparam[opt] string texture the texture file name. defaults to the name argument if nil.
]]
Client.addModel = function(name, model, texture)
    if not model then model = name end
    if not texture then texture = name end

    local dir = getDir("ORGM")
    local modelPrefix = dir .. "/media/models/weapons_"
    loadStaticZomboidModel("weapons_".. name, modelPrefix .. model .. ".txt", "Objects_".. texture)
end

--[[-Loads all 3d models. Trigged by OnGameBoot Event in client/ORGMClientEventHooks.lua
]]
Client.loadModels = function()

    Client.addModel('shotgun', 'shotgun', 'Shotgun')
    Client.addModel('shotgunsawn', 'shotgunsawn', 'ShotgunSawn')
    Client.addModel('shotgunblack', 'shotgunblack', 'Shotgun_Black')
    Client.addModel('shotgunsawnblack', 'shotgunsawnblack', 'ShotgunSawn_Black')

    -- revolvers
    Client.addModel("coltanaconda", "coltanaconda", "coltpython") -- 3.09, credits to Filibuster Rhymes
    Client.addModel('coltpython') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('coltsaa') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('rugalaskan') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('rugblackhawk') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('ruggp100') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('rugredhawk') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('rugsecsix', 'rugsecsix', 'swm10') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('rugblackhawk') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('swm10') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('swm19') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('swm252', 'swm29', 'swm19') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('swm29', 'swm29', 'swm19') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('swm36', 'swm36', 'sw10c') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('swm610', 'swm610', 'swm19c') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('taurusraging') -- 3.09, credits to Filibuster Rhymes

    -- pistols
    Client.addModel('beretta92') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('browninghp') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('glock17') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('glock20', 'glock20', 'glock17') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('glock21', 'glock21', 'glock17') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('glock22', 'glock17', 'glock17') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('coltcommander') -- new
    Client.addModel('deltaelite') -- new
    Client.addModel('deagle44') -- new
    Client.addModel('deaglexix') -- new
    Client.addModel('fn57') -- new
    Client.addModel('glock') -- new,
    Client.addModel('m1911') -- new
    Client.addModel('sfield19119') -- new
    Client.addModel('ppk') -- new
    Client.addModel('sfieldxd') -- new
    Client.addModel('rugermkii')

    -- smgs
    Client.addModel('beretta93r') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('glock18c', 'glock17', 'glock18c') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('kriss')
    Client.addModel('krissciv')
    Client.addModel('mp5') -- updated
    Client.addModel('mac10') -- new
    Client.addModel('mac11') -- new
    Client.addModel('p90')
    Client.addModel('skorpion') -- new
    Client.addModel('ump') -- updated
    Client.addModel('uzi') -- updated

    -- rifles
    Client.addModel('akm') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('akmn') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('ar10') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('ar15', 'ar15', 'm16') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('m16') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('m4c') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('sr25') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('r25', 'r25', 'sr25') -- 3.09, credits to Filibuster Rhymes

    Client.addModel('enfield') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('fnfal') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('lsr') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('m1903') -- 3.09, credits to Filibuster Rhymes
    Client.addModel('mini14') -- 3.09, credits to Filibuster Rhymes


    Client.addModel('henry')
    Client.addModel('hk91') -- new, replaces g3
    Client.addModel('sl8') -- new
    Client.addModel('m249') -- new
    Client.addModel('m14') -- updated
    Client.addModel('mosin') -- new
    Client.addModel('sks') -- updated
    Client.addModel('r700') -- new
    Client.addModel('sa80') -- updated
    Client.addModel('sig551') -- new

    Client.addModel('l96') -- new
    Client.addModel('kalash') -- updated
    Client.addModel('garand') -- new
    Client.addModel('svd') -- updated

    -- shotguns
    Client.addModel('m1216') -- new
    Client.addModel('super90') -- new
    Client.addModel('r870') -- new
    Client.addModel('silver') -- new
    Client.addModel('striker') -- new
    Client.addModel('stevens') -- new
    Client.addModel('spas12')

    ORGM.log(ORGM.INFO, "All 3d models loaded.")
end

--[[-

Called from OnEquipPrimary and OnGameStart in `ORGMClientEvents.lua`

@tparam IsoPlayer player
@tparam HandWeapon item

]]
Client.getFirearmNeedsUpdate = function(player, item)
    if item == nil or player == nil then return end
    if not player:isLocalPlayer() then return end
    if not Firearm.isFirearm(item) then return end

    ORGM.log(ORGM.DEBUG, "Checking BUILD_ID for ".. item:getType())

    Firearm.Stats.set(item)
    if Firearm.needsUpdate(item) then
        player:Say("Resetting this weapon to defaults due to ORGM changes. Ammo returned to inventory.")
        Client.unequipItemNow(player, item)
        local newItem = Firearm.replace(item, player:getInventory())
        player:setPrimaryHandItem(newItem)
        if newItem:isRequiresEquippedBothHands() then
            player:setSecondaryHandItem(newItem)
        end
        ISInventoryPage.dirtyUI()
    end
end


--[[- Instantly unequip the item if it's in the player's primary hand, skipping timed actions.

Used by Client.getFirearmNeedsUpdate() above when upgrading weapons to new ORGM versions.

@tparam IsoPlayer player
@tparam HandWeapon item

]]
Client.unequipItemNow = function(player, item)
    item:getContainer():setDrawDirty(true)
    local primary = player:getPrimaryHandItem()
    local secondary = player:getSecondaryHandItem()
    if item == primary then
        player:setPrimaryHandItem(nil)
    end
    if item == secondary then
        player:setSecondaryHandItem(nil)
    end
    getPlayerData(player:getPlayerNum()).playerInventory:refreshBackpacks()
end