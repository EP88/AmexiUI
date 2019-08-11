-- GLOBALS: AUICharDB, AUIPrivateDB, AUIDB

local AceAddon, AceAddonMinor = _G.LibStub("AceAddon-3.0")
local AddOn = AceAddon:NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0")
AddOn.callbacks = AddOn.callbacks or CallbackHandler:New(AddOn)
AddOn.DF = {profile = {}, global = {}}                              -- DEFAULTS
AddOn.Options = {type = "group", name = AddOnName, args = {}}


