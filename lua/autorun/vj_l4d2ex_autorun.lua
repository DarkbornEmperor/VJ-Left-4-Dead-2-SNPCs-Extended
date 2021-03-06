/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Left 4 Dead 2 SNPCs - Extended"
local AddonName = "Left 4 Dead 2"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_l4d2ex_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	if SERVER then
		resource.AddWorkshop("2520496592")
		resource.AddWorkshop("1770130953")
		resource.AddWorkshop("2393175267")
end

	local vCat = "Left 4 Dead 2"
	
	-- Common Infected
	VJ.AddNPC("Common Infected (Male)","npc_vj_l4d2_com_male",vCat)
    VJ.AddNPC("Common Infected (Female)","npc_vj_l4d2_com_female",vCat)
    VJ.AddNPC("Common Infected (Male) (Swamp)","npc_vj_l4d2_com_m_swamp",vCat)
    VJ.AddNPC("Common Infected (Female) (Swamp)","npc_vj_l4d2_com_f_swamp",vCat)
	VJ.AddNPC("Common Infected (Male) (Rain)","npc_vj_l4d2_com_m_rain",vCat)
	VJ.AddNPC("Common Infected (Female) (Rain)","npc_vj_l4d2_com_f_rain",vCat)
    VJ.AddNPC("Common Infected (Male) (Biker)","npc_vj_l4d2_com_m_biker",vCat)
	VJ.AddNPC("Common Infected (Male) (Formal)","npc_vj_l4d2_com_m_formal",vCat)
	VJ.AddNPC("Common Infected (Female) (Formal)","npc_vj_l4d2_com_f_formal",vCat)
	VJ.AddNPC("Common Infected (Male) (Whispering Oaks)","npc_vj_l4d2_com_m_whispoaks",vCat)
		
	-- Special Infected
	VJ.AddNPC("Tank (The Sacrifice)","npc_vj_l4d2_tank_sacrifice",vCat)
	VJ.AddNPC("Witch (The Passing)","npc_vj_l4d2_witch_passing",vCat)
	VJ.AddNPC("Screamer","npc_vj_l4d_screamer",vCat)
	VJ.AddNPC("Claws","npc_vj_l4d2_claws",vCat)	
	
	-- Spawners
	VJ.AddNPC("Random Common Infected Spawner","sent_vj_l4d2_cominf_sp",vCat)
	VJ.AddNPC("Random Common Infected","sent_vj_l4d2_cominf",vCat)
	VJ.AddNPC("AI Director","sent_vj_l4d2_director",vCat,true)	
	
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