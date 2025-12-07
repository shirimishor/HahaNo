---@meta _
-- PoseidonFailVO.lua


local PoseidonFailVoiceLines =
{
    BreakIfPlayed = false,
    RandomRemaining = true,
    PreLineWait = 0.25,
    Source = { LineHistoryName = "NPC_Poseidon_01", SubtitleColor = Color.PoseidonVoice },
    { Cue = "/VO/Poseidon_0342", Text = "Haha, {#Emph}no.", PlayFirst = true },
    { Cue = "/VO/Poseidon_0340", Text = "I'm keeping that one!"},
    { Cue = "/VO/Poseidon_0341", Text = "That one's {#Emph}Mine." },
    { Cue = "/VO/Poseidon_0239", Text = "I think {#Emph}Not." },
}


ModUtil.WrapBaseFunction("UseConsumableItem", function(baseFunc, consumableItem, ...)
    local couldDuplicate = consumableItem.CanDuplicate

    local result = baseFunc(consumableItem, ...)

    if couldDuplicate and consumableItem.CanDuplicate then
        thread(PlayVoiceLines, PoseidonFailVoiceLines)
    end

    return result
end)

