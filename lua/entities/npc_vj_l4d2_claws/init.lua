AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2021 by Cpt. Hazama, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/darkborn/l4d2/claws.mdl"} -- Place your model directory in here and vwala! Your NPC should now work!
ENT.StartHealth = 300
ENT.MeleeAttackDamage = 40
ENT.GeneralSoundPitch1 = 60
ENT.GeneralSoundPitch2 = 60
ENT.FootStepSoundLevel = 30
ENT.IdleSoundLevel = 50
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Leap(ent)
	if self.Leaping then return end
	if IsValid(self:GetEnemy()) && IsValid(self:GetEnemy():GetNW2Entity("VJ_L4D2_Terror")) then return end
	VJ_CreateSound(self,self.SoundTbl_Pounce,85,60)
	self.JumpLegalLandingTime = 0
	self:FaceCertainEntity(ent,true)
	ParticleEffect("hunter_leap_dust",self:GetPos(),self:GetAngles())
	self:SetGroundEntity(NULL)
	self:SetLocalVelocity(((self:GetEnemy():GetPos() +self:GetEnemy():OBBCenter()) -(self:GetPos() +self:OBBCenter())):GetNormal() *1000 +self:GetUp() *250)
	self.Leaping = true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if GetConVarNumber("ai_disabled") == 1 then return end
	if self.GhostMode then
		if !self.VJ_IsBeingControlled then
			self:GhostAI()
		else
			if self:CanUnGhost() then
				if self.VJ_TheController:KeyDown(IN_ATTACK) then
					self:SetGhost(false)
				end
			end
		end
		return
	end
	local incap = self.PinnedEnemy
	self.DisableChasingEnemy = IsValid(incap)
	self.HasIdleSounds = self.Crawling
	if self.Leaping then
		self.HasMeleeAttack = false
		self:SetNW2Int("NextSpecialT",CurTime() +2)
		if self:IsOnGround() then
			self.Leaping = false
			self.HasMeleeAttack = true
			if self:GetActivity() == ACT_JUMP then
				self:StartEngineTask(GetTaskList("TASK_RESET_ACTIVITY"),0)
			end
			self:VJ_TASK_IDLE_STAND()
		else
			if self:GetActivity() != ACT_JUMP && !IsValid(incap) then
				self:StartEngineTask(GetTaskList("TASK_SET_ACTIVITY"),ACT_JUMP)
				self:MaintainActivity()
			end
			self:FaceCertainEntity(self:GetEnemy(),true)
		end
		if IsValid(incap) then
			self:SetNW2Int("NextSpecialT",CurTime() +20)
		else
			for _,v in pairs(ents.FindInSphere(self:GetPos(),90)) do
				self:CheckHit(v)
			end
		end
	end
	if self:GetSequenceName(self:GetSequence()) == "Melee_Pounce" && (!IsValid(incap) or IsValid(incap) && incap:Health() <= 0) then
		self:SetState()
		self:StopMoving()
		self:VJ_TASK_IDLE_STAND()
	end
	if IsValid(incap) && incap:Health() > 0 then
		self:SetEnemy(incap)
		self.HasMeleeAttack = false
		if CurTime() > self.NextPinAnimationT then
			local anim = "Melee_Pounce"
			self:VJ_ACT_PLAYACTIVITY("vjseq_" .. anim,true,false,false)
			self.NextPinAnimationT = CurTime() +self:DecideAnimationLength(anim,false)
		end
		if CurTime() > self.NextPinDamageT then
			local dmginfo = DamageInfo()
			dmginfo:SetDamage(15)
			dmginfo:SetDamageType(DMG_SLASH)
			dmginfo:SetDamagePosition(incap:GetPos() +incap:OBBCenter())
			dmginfo:SetAttacker(self)
			dmginfo:SetInflictor(self)
			incap:TakeDamageInfo(dmginfo)
			if math.random(1,2) == 1 then
				VJ_CreateSound(self,"cpthazama/hunter/voice/attack/hunter_shred_0" .. math.random(1,9) .. ".wav",70,60)
			end
			self.NextPinDamageT = CurTime() +0.5
		end
	else
		self:SetState()
		self.HasMeleeAttack = true
	end
	
	local ent = self:GetEnemy()
	if IsValid(ent) && !IsValid(incap) then
		local dist = self:VJ_GetNearestPointToEntityDistance(ent)
		if self.Crawling && ent:Visible(self) && CurTime() > self.LastSightT then
			VJ_CreateSound(self,self.SoundTbl_Warning,85,60)
			self.LastSightT = CurTime() +6
		end
		if self.VJ_IsBeingControlled then
			if self.VJ_TheController:KeyDown(IN_DUCK) then
				if !self.Crawling then
					self.Crawling = true
					self.AnimTbl_IdleStand = {ACT_CROUCH}
					self.AnimTbl_Walk = {ACT_RUN_CROUCH}
					self.AnimTbl_Run = {ACT_RUN_CROUCH}
					self:StopMoving()
				else
					self.Crawling = false
					self.AnimTbl_IdleStand = {ACT_IDLE}
					self.AnimTbl_Walk = {ACT_WALK}
					self.AnimTbl_Run = {ACT_RUN}
				end
			end
			if self.VJ_TheController:KeyDown(IN_ATTACK2) then
				if self.Crawling then
					if CurTime() > self:GetNW2Int("NextSpecialT") then
						self:Leap(ent)
					end
				end
			end
			return
		end
		if dist <= 950 then
			if !self.Crawling then
				self.Crawling = true
				self.AnimTbl_IdleStand = {ACT_CROUCH}
				self.AnimTbl_Walk = {ACT_RUN_CROUCH}
				self.AnimTbl_Run = {ACT_RUN_CROUCH}
				self:StopMoving()
			end
			if self.Crawling then
				if dist <= 800 && ent:Visible(self) && CurTime() > self:GetNW2Int("NextSpecialT") then
					self:Leap(ent)
				end
			end
		else
			if self.Crawling then
				self.Crawling = false
				self.AnimTbl_IdleStand = {ACT_IDLE}
				self.AnimTbl_Walk = {ACT_WALK}
				self.AnimTbl_Run = {ACT_RUN}
			end
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2021 by Cpt. Hazama, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/