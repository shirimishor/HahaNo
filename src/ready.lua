
---@meta _
---@diagnostic disable: lowercase-global


--setting up VOs
local PoseidonFailVoiceLines =
{
    BreakIfPlayed = false,
    RandomRemaining = true,
    PreLineWait = 0.25,
    Source = { LineHistoryName = "NPC_Poseidon_01", SubtitleColor = game.Color.PoseidonVoice },
    { Cue = "/VO/Poseidon_0239", Text = "I think not." },
    { Cue = "/VO/Poseidon_0340", Text = "I'm keeping {#Emph}that {#Prev}one!" },
    { Cue = "/VO/Poseidon_0341", Text = "That one's {#Emph}mine!" },
    { Cue = "/VO/Poseidon_0342", Text = "{#Emph}Hah-hah{#Prev}, no!", , PlayFirst = true }
}



--triggering VOs on failure
modutil.mod.Path.Wrap("UseConsumableItem", function(base, consumableItem, ...)
    local couldDuplicate = consumableItem.CanDuplicate
    local result = base(consumableItem, ...)
    if couldDuplicate and consumableItem.CanDuplicate then
        thread(PlayVoiceLines, PoseidonFailVoiceLines)
    end
    return result
end)

