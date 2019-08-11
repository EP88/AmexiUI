-------------------------------------------
--
--          Big thanks to:
--
--      Tukz - Tukui
--
-------------------------------------------

local AddOn, AUI = ...
local Resolution = select(1, GetPhysicalScreenSize()).."x"..select(2, GetPhysicalScreenSize())
local Windowed = Display_DisplayModeDropDown:windowedmode()
local Fullscreen = Display_DisplayModeDropDown:fullscreenmode()

AUI[1] = CreateFrame("Frame")
AUI[2] = {}
AUI[3] = {}
AUI[4] = {}

function AUI:unpack()
    return self[1], self[2], self[3], self[4]
end

AUI[1].WindowedMode = Windowed
AUI[1].FullscreenMode = Fullscreen
AUI[1].Resolution = Resolution
AUI[1].ScreenHeight = tonumber(string.match(AUI[1].Resolution, "%d+x(%d+)"))
AUI[1].ScreenWidth = tonumber(string.match(AUI[1].Resolution, "(%d+)x+%d"))
AUI[1].PlayerName = UnitName("player")
AUI[1].PlayerClass = select(2, UnitClass("player"))
AUI[1].PlayerLevel = UnitLevel("player")
AUI[1].PlayerFaction = select(2, UnitFactionGroup("player"))
AUI[1].PlayerRace = select(2, UnitRace("player"))
AUI[1].PlayerRealm = GetRealmName()
AUI[1].Version = GetAddOnMetadata(AddOn, "Version")
AUI[1].VersionNumber = toNumber(AUI[1].Version)
AUI[1].WelcomeMessage = "|c0024AAAAAmexi|cFFFFFFFFUI|r "..AUI[1].Version.." - /aui help"

SLASH_RELOADUI1 = "/rl"
SLASH_RELOADUI2 = "/reloadui"
SlashCmdList.RELOADUI = ReloadUI

AUI = AUI