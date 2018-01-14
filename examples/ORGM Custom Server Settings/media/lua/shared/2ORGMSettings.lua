-- This file shows how to customize ORGM's settings.
-- It is given the name 2ORGMSettings.lua (note the 2 prefix) to ensure its
-- loaded after the ORGM core, but before ORGM actually does anything.
-- All values here are at default values.


local Settings = ORGM.Settings

-- LogLevel: This controls how much text ORGM prints to the console and log file.
-- valid options are ORGM.ERROR, ORGM.WARN, ORGM.INFO, and ORGM.DEBUG (default ORGM.INFO)
Settings.LogLevel = ORGM.INFO

-- JammingEnabled: Turns firearm jamming on or off.
-- valid options are true or false. (default true)
Settings.JammingEnabled = true

-- CasesEnabled: Turns ejecting of empty cases on or off.
-- valid options are true or false. (default true)
Settings.CasesEnabled = true

-- RemoveBaseFirearms:  Stops spawning of the base game firearms.
-- valid options are true or false (default true)
Settings.RemoveBaseFirearms = true

-- DefaultMagazineReoadTime:  The base time it takes to load a round into a magazine, before
-- modifiers for panic levels and reloading skill are applied. Note specific magazines may
-- override this value.
-- valid options are any integer number greater then 0 (default: 30)
Settings.DefaultMagazineReoadTime = 30

----------------------------------
-- Spawn Rate Multipliers
-- These values tweak the various spawn rates, and stack with the sandbox weapon loot rarity 
-- settings. Setting any of these to 0 will disable spawning of those items completely, while
-- a value of 1 is normal ORGM spawning.

-- FirearmSpawnModifier: Multiplier for ALL firearms spawning.
Settings.FirearmSpawnModifier = 1.0

-- CivilianFirearmSpawnModifier: Multiplier for the chances a firearm is civilian class.
Settings.CivilianFirearmSpawnModifier = 1.0

-- PoliceFirearmSpawnModifier: Multiplier for the chances a firearm is police class.
Settings.PoliceFirearmSpawnModifier = 1.0

-- MilitaryFirearmSpawnModifier: Multiplier for the chances a firearm is military class.
Settings.MilitaryFirearmSpawnModifier = 1.0

-- AmmoSpawnModifier:
Settings.AmmoSpawnModifier = 1.0

-- MagazineSpawnModifier:
Settings.MagazineSpawnModifier = 1.0

-- RepairKitSpawnModifier:
Settings.RepairKitSpawnModifier = 1.0

-- ComponentSpawnModifier:
Settings.ComponentSpawnModifier = 1.0

----------------------------------
-- Compatibility Patch Toggles
-- These determine if the built in compatibility patches should be used. These are only valid
-- If the mod in question is actually loaded.

-- UseSilencersPatch: Patch Nolan's ORGM Silencers mod
-- valid options are true or false (default: true)
Settings.UseSilencersPatch = true

-- UseNecroforgePatch: Patch Svarog's NecroForge mod
-- valid options are true or false (default: true)
Settings.UseNecroforgePatch = true

-- UseSurvivorsPatch: Patch Nolan's Survivors mod
-- valid options are true or false (default: true)
Settings.UseSurvivorsPatch = true
