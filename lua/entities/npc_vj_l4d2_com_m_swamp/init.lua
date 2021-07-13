AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/darkborn/l4d2/common/common_male_tanktop_jeans_swamp.mdl","models/darkborn/l4d2/common/common_male_tanktop_overalls_swamp.mdl","models/darkborn/l4d2/common/common_male_tshirt_cargos_swamp.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

    if self:GetModel() == "models/darkborn/l4d2/common/common_male_tanktop_jeans_swamp.mdl" then
		self:SetBodygroup(0,math.random(0,3))
		self:SetBodygroup(1,math.random(0,6))
		self:SetSkin(math.random(0,7))
	end 
    if self:GetModel() == "models/darkborn/l4d2/common/common_male_tanktop_overalls_swamp.mdl" then
		self:SetBodygroup(0,math.random(0,5))
		self:SetBodygroup(1,math.random(0,5))
                self:SetSkin(math.random(0,7))
	end
        if self:GetModel() == "models/darkborn/l4d2/common/common_male_tshirt_cargos_swamp.mdl" then
		self:SetBodygroup(0,math.random(0,3))
		self:SetBodygroup(1,math.random(0,5))
        self:SetSkin(math.random(0,7))
     end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Gibs(gType)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo,hitgroup)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/




