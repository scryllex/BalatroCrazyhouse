SMODS.PokerHandPart {
    key = 'rainbow',
    func = function (hand)
        local rainbow = {}
        local suits = {}
        local wilds = 0

        for _, card in ipairs(hand) do
            if SMODS.has_any_suit(card) then
                table.append(rainbow, card)
                wilds = wilds + 1
            elseif SMODS.has_no_suit(card) then
                -- pass
            else
                if suits[card.base.suit] then
                    -- pass
                else
                    table.append(rainbow, card)
                    suits[card.base.suit] = true
                end
                
            end
        end

        return table.accul(suits) + wilds >= 5 and rainbow or {}
    end
}

SMODS.PokerHand {
    key = 'Rainbow',
    chips = 25,
    mult = 3,
    l_chips = 15,
    l_mult = 2,
    evaluate = function (parts, hand)
        if not next(parts.czh_rainbow) then return {} end
        return {
            parts.czh_rainbow
        }
    end,
    example = {
        {'S_2', true},
        {'H_3', true},
        {'Sc_5', true},
        {'C_6', true},
        {'D_7', true}
    },
    above_hand = 'Three of a Kind'
}