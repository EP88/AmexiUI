local A, C = select(2, ...):unpack()

-------------------------------------
-- Default settings for AmexiUI
-- Based on old DoomKittyUI.
-------------------------------------

C["General"] = {
    ["BackdropColor"] = "",
    ["BorderColor"] = "",
    ["Scaling"] = {
        ["Options"] = {
            ["Pixel Perfection"] = "Pixel Perfection",
            ["Smallest"] = "Smallest",
            ["Small"] = "Small",
            ["Medium"] = "Medium"],
            ["Large"] = "Large",
            ["Oversize"]= "Oversize",
        },

        ["Value"] = "Pixel Perfection",
    },
}

C["ActionBars"] = {
    ["Enable"] = true,
    ["AddNewSpells"] = false,
    ["HotKey"] = false,
    ["ShapeShift"] = true,
    ["Pet"] = true,
    ["SwitchBarOnStance"] = true,
    ["Font"] = "Ubuntu-Light",
}

C["Auras"] = {
    ["Enable"] = true,
    ["Font"] = "Ubuntu-Light",
}

C["Bags"] = {
    ["Enable"] = true,
    ["ButtonSize"] = true,
    ["Spacing"] = true,
    ["ItemsPerRow"] = true,
    ["PulseNewItem"] = true,
    ["Font"] = "Ubuntu-Light",
}

C["Chat"] = {

}

C["Cooldowns"] = {

}

C["DataTexts"] = {

}

C["Loot"] = {

}

C["Merchant"] = {

}

C["Misc"] = {

}

C["NamePlates"] = {

}

C["Party"] = {

}

C["Raid"] = {

}

C["Tooltips"] = {

}

C["UnitFrames"] = {
    ["Enable"] = true,
    ["Portrait"] = false,
    ["CastBar"] = true,
    ["ComboBar"] = true,
    ["Smooth"] = true,
    ["Font"] = "Ubuntu-Light",
}
