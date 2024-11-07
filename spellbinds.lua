-- Register a slash command that the player can use to trigger the function
SLASH_SHOWKEYBINDS1 = '/showkeybinds'
SlashCmdList["SHOWKEYBINDS"] = function()
    -- Iterate over a larger range to ensure all action bars, including those potentially added by UI mods, are covered
    for slot = 1, 180 do  -- Extended range to include possible custom bar slots
        local type, id, subType = GetActionInfo(slot)

        if type == "spell" and id then
            local spellName = GetSpellInfo(id)  -- Get the spell name from the ID
            local keyBind = GetBindingKey("ACTIONBUTTON" .. slot)  -- Get the keybinding for the action slot

            if spellName and keyBind then
                print("Ability:", spellName, " - Keybind:", keyBind)
            end
        elseif type == "macro" and id then
            local macroName = GetMacroInfo(id)  -- Get the macro name
            local keyBind = GetBindingKey("ACTIONBUTTON" .. slot)

            if macroName and keyBind then
                print("Macro:", macroName, " - Keybind:", keyBind)
            end
        end
    end
end

-- Optional: Create a button to trigger the function for ease of use
local button = CreateFrame("Button", "KeybindButton", UIParent, "UIPanelButtonTemplate")
button:SetSize(120, 30)  -- Set button size: width, height
button:SetText("Show Keybinds")
button:SetPoint("CENTER")  -- Position the button at the center of the screen
button:SetScript("OnClick", function()
    SlashCmdList["SHOWKEYBINDS"]()  -- Call the function on button click
end)
