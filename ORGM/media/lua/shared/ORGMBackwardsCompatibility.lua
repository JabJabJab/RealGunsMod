--[[
    Everything in here exists for backwards compatibility with ORGM 2.00 to 2.03
    This file will be removed at a later date.
    If you have a 3d party mod that uses any of these tables it needs to be updated.
]]



ORGMAlternateAmmoTable = ORGM.AlternateAmmoTable
ORGMMasterAmmoTable = ORGM.AmmoTable
ORGMMasterMagTable = ORGM.MagazineTable
ORGMMasterWeaponTable = ORGM.FirearmTable
ORGMRepairKitsTable = { }
ORGMWeaponModsTable = { }

ORGM.onBootBackwardsCompatibility = function()
    for key, value in pairs(ORGM.ComponentTable) do
        table.insert(ORGMWeaponModsTable, key)
    end
    for key, value in pairs(ORGM.RepairKitTable) do
        table.insert(ORGMRepairKitsTable, key)
    end
end
