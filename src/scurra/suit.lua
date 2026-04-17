local utils = require('src.utils')

SMODS.Atlas {
    key = 'Scurra_suit',
    px = 71,
    py = 95,
    path = 'scurra_suit.png'
}

SMODS.Atlas {
    key = 'Scurra_icon',
    px = 18,
    py = 18,
    path = 'scurra_icon.png'
}

SMODS.Suit {
    key = 'Scurra',
    card_key = 'Sc',
    lc_atlas = 'Scurra_suit',
    hc_atlas = 'Scurra_suit',
    pos = {y = 0},
    lc_ui_atlas = 'Scurra_icon',
    hc_ui_atlas = 'Scurra_icon',
    ui_pos = {x = 0, y = 0},
    lc_colour = HEX('CC338B'),
    hc_colour = HEX('CC338B'),
    in_pool = function (self, args)
        if args.initial_deck then
            return G.GAME.selected_back.effect.config.scurra
        end
        return true
    end,
    loc_vars = function (self, info_queue, card)
        table.append(info_queue, {
            key = 'czh_Scurra_desc',
            set = 'Other'
        })
    end,
    prefix_config = {
        card_key = false
    }
}

SMODS.Atlas {
    key = 'Scurra_back',
    px = 71,
    py = 95,
    path = 'scurra_back.png'
}

SMODS.Back {
    key = 'Scurra',
    atlas = 'Scurra_back',
    pos = {x = 0, y = 0},
    config = {
        scurra = true
    }
}

SMODS.Back {
    key = 'CScurra',
    atlas = 'Scurra_back',
    pos = {x = 1, y = 0},
    apply = function (self, back)
        G.E_MANAGER:add_event(Event{
            func = function ()
                local suits = table.keys(SMODS.Suits)
                pseudoshuffle(suits, pseudoseed('cscurra'))

                for k, v in pairs(G.playing_cards) do
                    if suits[v:get_id() % 5 + 1] == v.base.suit then
                        v:change_suit('czh_Scurra')
                    end
                end
                return true
            end
        })
    end
}