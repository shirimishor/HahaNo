
---@meta _
---@diagnostic disable: lowercase-global


--setting up VOs
local PoseidonFailVoiceLines =
{
    BreakIfPlayed = true,
    RandomRemaining = true,
    PreLineWait = 0.25,
    Source = { LineHistoryName = "NPC_Poseidon_01", SubtitleColor = game.Color.PoseidonVoice },
    { Cue = "/VO/Poseidon_0239", Text = "I think not." },
    { Cue = "/VO/Poseidon_0340", Text = "I'm keeping {#Emph}that {#Prev}one!" },
    { Cue = "/VO/Poseidon_0341", Text = "That one's {#Emph}mine!" },
    { Cue = "/VO/Poseidon_0342", Text = "{#Emph}Hah-hah{#Prev}, no!", PlayFirst = true }
}

--classicOnly option from config
local ClassicPoseidonFailVoiceLines =
{
    BreakIfPlayed = true,
    RandomRemaining = true,
    PreLineWait = 0.25,
    Source = { LineHistoryName = "NPC_Poseidon_01", SubtitleColor = game.Color.PoseidonVoice },
    { Cue = "/VO/Poseidon_0342", Text = "{#Emph}Hah-hah{#Prev}, no!", PlayFirst = true },
    { Cue = "/VO/Poseidon_0342", Text = "{#Emph}Hah-hah{#Prev}, no!" }
}


--triggering VOs on failure
modutil.mod.Path.Wrap("UseConsumableItem", function(base, consumableItem, ...)
    local couldDuplicate = consumableItem.CanDuplicate
    local result = base(consumableItem, ...)
    if couldDuplicate and consumableItem.CanDuplicate then
        if config.classicOnly then
            thread(PlayVoiceLines, ClassicPoseidonFailVoiceLines )
        else
            thread(PlayVoiceLines, PoseidonFailVoiceLines )
        end
    end
    return result
end)


