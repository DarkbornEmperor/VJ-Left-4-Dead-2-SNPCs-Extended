AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2021 by Cpt. Hazama, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/darkborn/l4d2/witch_bride.mdl"} -- Place your model directory in here and vwala! Your NPC should now work!
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	local c = self.tbl_Collision
	self:SetCollisionBounds(Vector(c.x,c.y,c.z),Vector(-c.x,-c.y,0))
	self.IdleLoop = CreateSound(self,"darkborn/music/witchencroacher_bride.wav")
	self.IdleLoop:SetSoundLevel(0.2)
	self.IdleLoopAngry = CreateSound(self,"cpthazama/music/special_witch.wav")
	self.IdleLoopAngry:SetSoundLevel(0.2)
	self.IdleLoopFire = CreateSound(self,"cpthazama/music/special_witch_fire.wav")
	self.IdleLoopFire:SetSoundLevel(0.2)
	self.CurrentTrack = 0
	self.IsSitting = false
	self.Aggro = false
	self.VJ_IsWitch = true
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_veil1"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_veil2"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_veil3"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_front1"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_front2"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_front3"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Rhip1"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Rhip2"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Rhip3"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Rear1"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Rear2"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_rear3"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Lside1"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Lside2"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Rside1"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Rside2"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Lfront1"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Lfront2"),1)
	self:ManipulateBoneJiggle(self:LookupBone("ValveBiped.jiggle_dress_Lfront3"),1)
	self.SoundTbl_NoAggro = {
		"cpthazama/witch/voice/idle/female_cry_1.wav",
		"cpthazama/witch/voice/idle/female_cry_2.wav",
		"cpthazama/witch/voice/idle/female_cry_3.wav",
		"cpthazama/witch/voice/idle/female_cry_4.wav",
		"cpthazama/witch/voice/idle/walking_cry_07.wav",
		"cpthazama/witch/voice/idle/walking_cry_10.wav",
		"cpthazama/witch/voice/idle/walking_cry_11.wav",
		"cpthazama/witch/voice/idle/walking_cry_12.wav"
	}
	self.LastColor = Color(255,255,255,255)
	self.AggroLevel = 0
	self.AggroTarget = NULL
	self.AggroIncrease = 0
	self.ResetAggroT = 0
	self.GrowlT = 0
	self.CanSit = false
	self.HasMeleeAttack = false
	self.IsRunningAway = false
	self.NextRunAwayT = 0
	IDLE_SIT = VJ_SequenceToActivity(self,"Idle_Sitting")
	self:SetNW2Int("NextSpecialT",CurTime() +2)
	self.SpecialTable = {}
	self.SpecialWitchTable = {}
	-- if math.random(1,3) == 1 then
		-- self.IsSitting = true
		-- self.CanSit = true
		-- self.AnimTbl_IdleStand = {IDLE_SIT}
	-- end
end
/*-----------------------------------------------
	*** Copyright (c) 2021 by Cpt. Hazama, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/