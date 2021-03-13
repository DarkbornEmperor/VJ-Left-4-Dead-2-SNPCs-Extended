AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/darkborn/l4d2/common/common_female_tshirt_skirt_swamp.mdl","models/darkborn/l4d2/common/common_female_tshirt_skirt.mdl","models/darkborn/l4d2/common/common_female_tanktop_jeans_swamp.mdl"} 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
        if self:GetModel() == "models/darkborn/l4d2/common/common_female_tshirt_skirt_swamp.mdl" then
		self:SetBodygroup(0,math.random(0,1))
		self:SetBodygroup(1,math.random(0,3))
end 
        if self:GetModel() == "models/darkborn/l4d2/common/common_female_tshirt_skirt.mdl" then
		self:SetBodygroup(0,math.random(0,3))
		self:SetBodygroup(1,math.random(0,3))  
	end
	
	    if self:GetModel() == "models/darkborn/l4d2/common/common_female_tanktop_jeans_swamp.mdl" then
		self:SetBodygroup(0,math.random(0,1))
		self:SetBodygroup(1,math.random(0,3))  
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




