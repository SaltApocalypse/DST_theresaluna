local assets =
{
	Asset("ANIM", "anim/theresaluna.zip"),
	Asset("ANIM", "anim/ghost_theresaluna_build.zip"),
}

local skins =
{
	normal_skin = "theresaluna",
	ghost_skin = "ghost_theresaluna_build",
}

return CreatePrefabSkin("theresaluna_none",
	{
		base_prefab = "theresaluna",
		type = "base",
		assets = assets,
		skins = skins,
		skin_tags = { "THERESALUNA", "CHARACTER", "BASE" },
		build_name_override = "theresaluna",
		rarity = "Character",
	}
)
