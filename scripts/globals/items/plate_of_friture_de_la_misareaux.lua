-----------------------------------------
-- ID: 5159
-- Item: plate_of_friture_de_la_misareaux
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Dexterity 3
-- Vitality 3
-- Mind -3
-- Defense 5
-- Ranged ATT % 7
-- Ranged ATT Cap 15
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 14400, 5159)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.DEX, 3)
    target:addMod(tpz.mod.VIT, 3)
    target:addMod(tpz.mod.MND, -3)
    target:addMod(tpz.mod.DEF, 5)
    target:addMod(tpz.mod.FOOD_RATTP, 7)
    target:addMod(tpz.mod.FOOD_RATT_CAP, 15)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.DEX, 3)
    target:delMod(tpz.mod.VIT, 3)
    target:delMod(tpz.mod.MND, -3)
    target:delMod(tpz.mod.DEF, 5)
    target:delMod(tpz.mod.FOOD_RATTP, 7)
    target:delMod(tpz.mod.FOOD_RATT_CAP, 15)
end
