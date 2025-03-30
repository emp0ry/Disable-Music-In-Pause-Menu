local mod = RegisterMod("Disable Music In Pause Menu", 1)
local music = MusicManager()
local game = Game()
local wasPauseMenuOpen = false

function mod:CheckPauseMenuMusic()
    local isPauseMenuOpen = game:GetPauseMenuState() == 1
    if isPauseMenuOpen ~= wasPauseMenuOpen then
        if isPauseMenuOpen then
            music:Disable()
        else
            music:Enable()
        end
        wasPauseMenuOpen = isPauseMenuOpen
    end
end

function mod:OnGameEnd()
    music:Enable()
    wasPauseMenuOpen = false
end

mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.CheckPauseMenuMusic)
mod:AddCallback(ModCallbacks.MC_MENU_INPUT_ACTION, mod.OnGameEnd)
