-- GLOBALS: AUICharDB, AUIPrivateDB, AUIDB

--Lua functions
local _G, min, format, pairs, strsplit, unpack, wipe, type, tcopy = _G, min, format, pairs, strsplit, unpack, wipe, type, table.copy
--WoW API / Variables
local hooksecurefunc = hooksecurefunc
local issecurevariable = issecurevariable
local CreateFrame = CreateFrame
local GetAddOnInfo = GetAddOnInfo
local GetAddOnMetadata = GetAddOnMetadata
local GetTime = GetTime
local HideUIPanel = HideUIPanel
local GetAddOnEnableState = GetAddOnEnableState
local InCombatLockdown = InCombatLockdown
local IsAddOnLoaded = IsAddOnLoaded
local LoadAddOn = LoadAddOn
local ReloadUI = ReloadUI

local ERR_NOT_IN_COMBAT = ERR_NOT_IN_COMBAT
local GameMenuButtonAddons = GameMenuButtonAddons
local GameMenuButtonLogout = GameMenuButtonLogout
local GameMenuFrame = GameMenuFrame

local AceAddon, AceAddonMinor = _G.LibStub('AceAddon-3.0')
local CallbackHandler = _G.LibStub('CallbackHandler-1.0')

local AddOnName, Engine = ...
local AddOn = AceAddon:NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0")
AddOn.callbacks = AddOn.callbacks or CallbackHandler:New(AddOn)
AddOn.DF = {profile = {}, global = {}}; AddOn.privateVars = {profile = {}}
AddOn.Options = {type = "group", name = AddOnName, args = {}}

Engine[1] = AddOn                           -- AmexiUI / AUI base
Engine[2] = {}                              -- Locale
Engine[3] = AddOn.privateVars.profile       -- Private
Engine[4] = AddOn.DF.profile                -- Profile
Engine[5] = AddOn.DF.global                 -- Global

_G[AddOnName] = Engine

--[[
    Modules goes here
]]

function AddOn:OnInitialize()
    if not AUICharacterDB then
        AUICharacterDB = {}
    end

    self.db = tcopy(self.DF.profile, true)
    self.global = tcopy(self.DF.global, true)

    local AUIDB
    if AUIDB then
        if AUIDB.global then
            self:CopyTable(self.global, AUIDB.global)
        end

        local profileKey
        if AUIDB.profileKeys then
            profileKey = AUIDB.profileKeys[self.PlayerName..' - '..self.PlayerRealm]
        end

        if profileKey and AUIDB.profiles and AUIDB.profiles[profileKey] then
            self:CopyTable(self.db, AUIDB.profiles[profileKey])
        end
    end

    self.private = tcopy(self.privateVars.profile, true)

    local AUIPrivateDB
    if AUIPrivateDB then
        local profileKey
        if AUIPrivateDB.profileKeys then
            profileKey = AUIPrivateDB.profileKeys[self.PlayerName..' - '..self.PlayerRealm]
        end

        if profileKey and AUIPrivateDB.profiles and AUIPrivateDB.profiles[profileKey] then
            self:CopyTable(self.private, AUIPrivateDB.profiles[profileKey])
        end
    end

    -- UIScale
    
    local GameMenuButton = CreateFrame("Button", nil, GameMenuFrame, "GameMenuButtonTemplate")
    GameMenuButton:SetText("|c0024AAAAAmexi|rUI")
    GameMenuButton:SetScript("OnClick", function()
        AddOn:ToggleOptionsUI()
        HideUIPanel(GameMenuFrame)
    end)
    GameMenuFrame[AddOnName] = GameMenuButton

    if not IsAddOnLoaded("ConsolePortUI_Menu") then
        GameMenuButton:SetSize(GameMenuButtonLogout:GetWidth(), GameMenuButtonLogout:GetHeight())
        GameMenuButton:SetPoint("TOPLEFT", GameMenuButtonAddons, "BOTTOMLEFT", 0, -1)
        hooksecurefunc('GameMenuFrame_UpdateVisibleButtons', self.PositionGameMenuButton)
    end
end

function AddOn:PositionGameMenuButton()
    GameMenuFrame:SetHeight(GameMenuFrame:GetHeight() + GameMenuButtonLogout:GetHeight() - 4)
    local _, relTo, _, _, offY = GameMenuButtonLogout:GetPoint()
    if relTo ~=GameMenuFrame[AddOnName] then
        GameMenuFrame[AddOnName]:ClearAllPoints()
        GameMenuFrame[AddOnName]:SetPoint("TOPLEFT", relTo, "BOTTOMLEFT", 0, -1)
        GameMenuButtonLogout:ClearAllPoints()
        GameMenuButtonLogout:SetPoint("TOPLEFT", GameMenuFrame[AddOnName], "BOTTOMLEFT", 0, offY)
    end
end

local LoadUI = CreateFrame("Frame")
LoadUI:RegisterEvent("PLAYER_LOGIN")
LoadUI:SetScript("OnEvent", function()
    AddOn:Initialize()
end)

function AddOn:ResetProfile()

end

function AddOn:OnProfileReset()

end
