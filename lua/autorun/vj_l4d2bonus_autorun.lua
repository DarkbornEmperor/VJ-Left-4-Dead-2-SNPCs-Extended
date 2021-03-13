/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Left 4 Dead 2 Bonus SNPCs"
local AddonName = "Left 4 Dead 2 Bonus"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_l4d2bonus_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Left 4 Dead 2"
	
	-- Common Infected
	VJ.AddNPC("Common Infected (Male)","npc_vj_l4d_com_male_l4d2",vCat)
    VJ.AddNPC("Common Infected (Female)","npc_vj_l4d_com_female_l4d2",vCat)
    VJ.AddNPC("Common Infected (Male Swamp)","npc_vj_l4d_com_maleswamp_l4d2",vCat)
    VJ.AddNPC("Common Infected (Female Swamp)","npc_vj_l4d_com_femaleswamp_l4d2",vCat)
	VJ.AddNPC("Common Infected (Rain)","npc_vj_l4d_com_malerain_l4d2",vCat)
	VJ.AddNPC("Common Infected (Female Rain)","npc_vj_l4d_com_femalerain_l4d2",vCat)
    VJ.AddNPC("Common Infected (Biker)","npc_vj_l4d_com_malebiker_l4d2",vCat)
	VJ.AddNPC("Common Infected (Male Formal)","npc_vj_l4d_com_maleformal_l4d2",vCat)
	VJ.AddNPC("Common Infected (Female Formal)","npc_vj_l4d_com_femaleformal_l4d2",vCat)
	VJ.AddNPC("Common Infected (Whispering Oaks)","npc_vj_l4d_com_malewhispoaks_l4d2",vCat)
		
	-- Special Infected
	VJ.AddNPC("Tank (The Sacrifice)","npc_vj_l4d2_tank_sacrifice",vCat)
	VJ.AddNPC("Witch (The Passing)","npc_vj_l4d2_witch_passing",vCat)
	VJ.AddNPC("Screamer","npc_vj_l4d_screamer","Left 4 Dead")
	VJ.AddNPC("Claws","npc_vj_l4d2_claws",vCat)
	
	-- Spawners
	VJ.AddNPC("Random Common Infected Spawner","sent_vj_l4d2_cominf_sp",vCat)
	VJ.AddNPC("Random Common Infected","sent_vj_l4d2_cominf",vCat)
	
		VJ.AddParticle("particles/vj_l4d_screamer_fx.pcf",{
		"screamer_explode",
		"screamer_vomit",
	})
	
	-- Precache Models --
	util.PrecacheModel("models/cpthazama/l4d1/anim_common.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_female_formal.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_female_tanktop_jeans.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_female_tanktop_jeans_rain.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_female_tanktop_jeans_swamp.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_female_tanktop_tshirt_skirt.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_female_tanktop_tshirt_skirt_swamp.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_dressshirt_jeans.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_formal.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_polo_jeans.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_tanktop_jeans.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_tanktop_jeans_swamp.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_tanktop_overalls.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_tanktop_overalls_rain.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_tanktop_overalls_swamp.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_tanktop_cargos.mdl")
	util.PrecacheModel("models/darkborn/l4d2/common/common_male_tanktop_cargos_swamp.mdl")
	util.PrecacheModel("models/darkborn/l4d2/hulk_dlc3.mdl")
	util.PrecacheModel("models/darkborn/l4d2/witch_bride.mdl")	
	util.PrecacheModel("models/darkborn/l4d1/screamer.mdl")
	util.PrecacheModel("models/darkborn/l4d2/claws.mdl")

	hook.Add("RenderScreenspaceEffects","VJ_L4D1_ScreenEffects",function()
		local ply = LocalPlayer()
		if ply:GetNW2Bool("VJ_L4D1_ScreamerEffect") then
			if CurTime() > ply.VJ_L4D1_ScreamerEffectT then
				ply.VJ_L4D1_ScreamerEffectAmount = ply.VJ_L4D1_ScreamerEffectAmount -0.10
				ply.VJ_L4D1_ScreamerEffectT = CurTime() +1
			end
			DrawMaterialOverlay("models/shadertest/predator",ply.VJ_L4D1_ScreamerEffectAmount)
		else
			ply.VJ_L4D1_ScreamerEffectT = CurTime() +5.7
			ply.VJ_L4D1_ScreamerEffectAmount = 0.45
		end
	end)
	
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end