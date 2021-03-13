AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.SingleSpawner = true -- If set to true, it will spawn the entities once then remove itself
ENT.Model = {"models/props_junk/popcan01a.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=50,vRight=0,vUp=0},Entities = {"npc_vj_l4d_com_male_l4d2","npc_vj_l4d_com_female_l4d2","npc_vj_l4d_com_maleswamp_l4d2","npc_vj_l4d_com_femaleswamp_l4d2","npc_vj_l4d_com_malerain_l4d2","npc_vj_l4d_com_femalerain_l4d2","npc_vj_l4d_com_malebiker_l4d2","npc_vj_l4d_com_maleformal_l4d2","npc_vj_l4d_com_malewhispoaks_l4d2","npc_vj_l4d_com_femaleformal_l4d2"}},
}
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/