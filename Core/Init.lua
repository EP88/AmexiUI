local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub('LibElvUIPlugin-1.0')
local addon, Engine = ...

local AUI = LibStub('AceAddon-3.0'):NewAddon(addon, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0")
AUI.callbacks = AUI.callbacks or LibStub("CallbackHandler-1.0"):New(AUI)

Engine[1] = AUI
Engine[2] = E
Engine[3] = L
Engine[4] = V
Engine[5] = P
Engine[6] = G
_G[addon] = Engine

AUI.Config = {}

AUI["RegisteredModules"] = {}
local modules = {}
function AUI:RegisterModule(name)
    if self.initialized then
        local mod = self:GetModule(name)
        if (mod and mod.Initialize) then
            mod:Initialize()
        end
    else
        self["RegisteredModules"][#self["RegisteredModules"] + 1] = name
    end
end

function AUI:InitializeModules()
    for _, moduleName in pairs(AUI["RegisteredModules"]) do
        local mod = self:GetModule(moduleName)
        if mod.Initialize then
            mod:Initialize()
        else
            AUI:Print("Module <"..moduleName.."> is not loaded.")
        end
    end

    AUI.Modules = modules
end

function AUI:AddOptions()
    for _, func in pairs(AUI.Config) do
        func()
    end
end

hooksecurefunction(E, "Initialize", function()
    AUI:Init()
end)
