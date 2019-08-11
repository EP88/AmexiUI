local AmexiUI = select(2, ...)

local A, M, E, X, I = unpack(AmexiUI)

--Lua functions
local _G = _G
local tonumber, pairs, ipairs, error, unpack, select, tostring, smatch = tonumber, pairs, ipairs, error, unpack, select, tostring, string.match
local assert, type, xpcall, next, print = assert, type, xpcall, next, print
local gsub, strjoin, twipe, tinsert, tremove = gsub, strjoin, wipe, tinsert, tremove
local format, find, strrep, strlen, sub = format, strfind, strrep, strlen, strsub
--WoW API / Variables
local CreateFrame = CreateFrame
local GetCVar = GetCVar
local GetCVarBool = GetCVarBool
local GetNumGroupMembers = GetNumGroupMembers
local GetSpecialization = GetSpecialization
local hooksecurefunc = hooksecurefunc
local InCombatLockdown = InCombatLockdown
local IsAddOnLoaded = IsAddOnLoaded
local IsInGroup = IsInGroup
local IsInGuild = IsInGuild
local IsInRaid = IsInRaid
local SetCVar = SetCVar
local UnitFactionGroup = UnitFactionGroup
local UnitGUID = UnitGUID

local ERR_NOT_IN_COMBAT = ERR_NOT_IN_COMBAT
local LE_PARTY_CATEGORY_HOME = LE_PARTY_CATEGORY_HOME
local LE_PARTY_CATEGORY_INSTANCE = LE_PARTY_CATEGORY_INSTANCE
local C_ChatInfo_SendAddonMessage = C_ChatInfo.SendAddonMessage
local C_Timer_After = C_Timer.After

A.Resolution = ({GetScreenResolutions()})[GetCurrentResolution()] or GetCVar('gxWindowedResolution')
A.ScreenWidth, A.ScreenHeight = GetPhysicalScreenSize()
A.IsMacClient = IsMacClient()
A.PlayerName = UnitName("player")
A.PlayerClass = select(2, UnitClass("player"))
A.PlayerLevel = UnitLevel("player")
A.PlayerFaction = select(2, UnitFactionGroup("player"))
A.PlayerRace = select(2, UnitRace("player"))
A.PlayerRealm = GetRealmName()
A.Version = GetAddOnMetadata("AmexiUI", "Version")

function A:CopyTable(currentTable, defaultTable)
    if type(currentTable) ~= "table" then currentTable = {} end

    if type(defaultTable) == "table" then
        for option, value in pairs(defaultTable) do
            if type(value) == "table" then
                value = self:CopyTable(currentTable[option], value)
            end

            currentTable[option] = value
        end
    end

    return currentTable
end

function A:StaggeredUpdateAll()

end

function A:Initialize()
    twipe(self.db)
    twipe(self.global)
    twipe(self.private)

    self.myguid = UnitGUID("player")
    self.data = LibStub("AceDB-3.0"):New("AUIDB", self.DF)
    self.data.RegisterCallback(self, "OnProfileChanged", "StaggeredUpdateAll")
    self.data.RegisterCallback(self, "OnProfileCopied", "StaggeredUpdateAll")
    self.data.RegisterCallback(self, "OnProfileReset", "OnProfileReset")
    self.charSettings = LibStub("AceDB-3.0"):New("AUIPrivateDB", self.privateVars)
    LibStub("LibDualSpec-1.0"):EnhanceDatabase(self.data, "AUIDB")
    self.private = self.charSettings.profile
    self.db = self.data.profile
    self.global = self.data.global

    --UIScale
    --LoadCommands
    --LoadAPI

    self.initialized = true

    --if self.private.install_complete == nil then
    --    self:Install()
    --end
end
