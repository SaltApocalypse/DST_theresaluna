-- [[============================================================]]
GLOBAL.setmetatable(env, { __index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end })

-- [[============================================================]]
-- Assets资源加载
Assets = {}

-- prefab预制体加载
PrefabFiles = { "theresaluna", "theresaluna_none" }

-- [[============================================================]]
-- 设置
TUNING.THERESALUNA_cfg_light = GetModConfigData("cfg_light")
TUNING.THERESALUNA_cfg_burden = GetModConfigData("cfg_burden")
TUNING.THERESALUNA_cfg_friendlybats = GetModConfigData("cfg_friendlybats")
-- debug
TUNING.THERESALUNA_cfg_debug = GetModConfigData("cfg_debug")

-- [[============================================================]]
-- 引入模组组成

-- modimport "modmain/debug.lua" -- 调试模块
modimport "modmain/language.lua"
modimport "modmain/character.lua"
modimport "modmain/tuning.lua"
modimport "modmain/player.lua"
-- modimport "modmain/playernet.lua" -- 玩家网络通讯
-- modimport "modmain/postprocess.lua" -- 后处理
-- modimport "modmain/action.lua" -- 动作
-- modimport "modmain/sg.lua" -- sg
-- modimport "modmain/recipes.lua" -- 配方
-- modimport "modmain/fx.lua" --  特效
-- modimport "modmain/rpc.lua" -- rpc

-- [[============================================================]]
