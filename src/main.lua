---@meta _
---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@module 'LuaENVY-ENVY-auto'
mods['LuaENVY-ENVY'].auto()
---@diagnostic disable: lowercase-global

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = _PLUGIN

-- Get definitions for the game's globals
---@module 'game'
game = rom.game
---@module 'game-import'
import_as_fallback(game)

---@module 'SGG_Modding-ModUtil'
modutil = mods['SGG_Modding-ModUtil']

-- Only run if enabled
if config.enabled == false then return end

-- Register the mod
local mod = modutil.mod.Mod.Register(_PLUGIN.guid)

-- Directly import your VO wrapper
import 'PoseidonFailVO.lua'

-- Debug print
print("Poseidon Fail VO mod loaded")
