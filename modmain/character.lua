-- [[============================================================]]

-- TODO: 等大月下出来之后定夺名称
local name = "__theresa__"
table.insert(PrefabFiles, name)

-- [[============================================================]]
-- 角色选取界面
STRINGS.CHARACTER_TITLES[name] = Loc("EN", "ZH")
STRINGS.CHARACTER_NAMES[name] = Loc("EN", "ZH")
STRINGS.NAMES[string.upper(name)] = STRINGS.CHARACTER_NAMES[name]
STRINGS.CHARACTER_DESCRIPTIONS[name] = Loc("*\n*\n*\n", "*\n*\n*\n")
STRINGS.CHARACTER_QUOTES[name] = Loc('"EN"', '"ZH"')

-- [[============================================================]]
-- 插入所需的 Assets
table.insert(Assets, Asset("ATLAS", "images/saveslot_portraits/" .. name .. ".xml"))
table.insert(Assets, Asset("ATLAS", "images/selectscreen_portraits/" .. name .. ".xml"))
table.insert(Assets, Asset("ATLAS", "images/map_icons/" .. name .. ".xml"))
table.insert(Assets, Asset("ATLAS", "images/avatars/avatar_" .. name .. ".xml"))
table.insert(Assets, Asset("ATLAS", "images/avatars/avatar_ghost_" .. name .. ".xml"))
table.insert(Assets, Asset("ATLAS", "images/avatars/self_inspect_" .. name .. ".xml"))
table.insert(Assets, Asset("ATLAS", "images/names_" .. name .. ".xml"))
table.insert(Assets, Asset("ATLAS", "images/names_gold_" .. name .. ".xml"))
table.insert(Assets, Asset("ATLAS", "bigportraits/" .. name .. ".xml"))
-- table.insert(Assets, Asset("ATLAS", "bigportraits/" .. name .. "_none.xml"))
table.insert(Assets, Asset("ANIM", "anim/ghost_" .. name .. "_build.zip"))

-- 额外的工作
AddMinimapAtlas("images/map_icons/" .. name .. ".xml")
AddModCharacter(name, "FEMALE")
-- PREFAB_SKINS[name] = {name .. "_none"}
-- STRINGS.SKIN_NAMES[name .. "_none"] = STRINGS.CHARACTER_NAMES[name]

-- [[============================================================]]
-- 文本翻译

local speech = deepcopy(require "speech_wendy")                       -- 基于温蒂
local override = require("speech_" .. name .. "_" .. Loc("en", "zh")) -- 进行部分文本替换
local function replace(t1, t2)
    for k, v in pairs(t2) do
        local tv = type(v)
        if t1[k] == nil then
            t1[k] = v
        elseif type(t1[k]) == tv then
            if tv == "string" then
                t1[k] = v
            elseif tv == "table" then
                replace(t1[k], v)
            end
        end
    end
end
replace(speech, override)

STRINGS.CHARACTERS[name:upper()] = speech
