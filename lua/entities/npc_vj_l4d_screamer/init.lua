AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2021 by Cpt. Hazama, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/darkborn/l4d1/screamer.mdl"} 
ENT.Behavior = VJ_BEHAVIOR_PASSIVE
ENT.DeathCorpseModel = {"models/darkborn/l4d1/screamer.mdl"}
ENT.CallForHelpDistance = 4000
ENT.CallForHelpSoundLevel = 100

ENT.VJC_Data = {
    CameraMode = 2, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
    ThirdP_Offset = Vector(0, 0, 0), -- The offset for the controller when the camera is in third person
    FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
    FirstP_Offset = Vector(8, 0, 2), -- The offset for the controller when the camera is in first person
}

-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
	"cpthazama/footsteps/infected/run/tile1.wav",
	"cpthazama/footsteps/infected/run/tile2.wav",
	"cpthazama/footsteps/infected/run/tile3.wav",
	"cpthazama/footsteps/infected/run/tile4.wav",
}
ENT.SoundTbl_Idle = {
	"darkborn/screamer/voice/idle/male_boomer_lurk_01.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_02.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_03.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_04.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_05.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_06.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_07.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_08.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_09.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_10.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_12.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_13.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_14.wav",
	"darkborn/screamer/voice/idle/male_boomer_lurk_15.wav",
}
ENT.SoundTbl_Alert = {
	"darkborn/screamer/voice/attack/male_boomer_spotprey_05.wav",
	"darkborn/screamer/voice/attack/male_boomer_spotprey_07.wav",
	"darkborn/screamer/voice/attack/male_boomer_spotprey_09.wav",
	"darkborn/screamer/voice/attack/male_boomer_spotprey_10.wav",
	"darkborn/screamer/voice/attack/male_boomer_spotprey_11.wav",
	"darkborn/screamer/voice/attack/male_boomer_spotprey_12.wav",
	"darkborn/screamer/voice/attack/male_zombie10_growl1.wav",
	"darkborn/screamer/voice/attack/male_zombie10_growl2.wav",
	"darkborn/screamer/voice/attack/male_zombie10_growl3.wav",
	"darkborn/screamer/voice/attack/male_zombie10_growl5.wav",
}
ENT.SoundTbl_CallForHelp = {
	"darkborn/screamer/explode/explo_medium_09.wav",
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"darkborn/screamer/voice/action/male_zombie10_growl4.wav",
	"darkborn/screamer/voice/action/male_zombie10_growl4.wav",
	"darkborn/screamer/voice/action/male_zombie10_growl4.wav",
	"darkborn/screamer/voice/action/male_zombie10_growl4.wav",
	"darkborn/screamer/voice/action/male_zombie10_growl4.wav",
	"darkborn/screamer/voice/action/male_zombie10_growl4.wav",
	"darkborn/screamer/voice/action/male_zombie10_growl4.wav",
}
ENT.SoundTbl_Pain = {
	"darkborn/screamer/voice/pain/male_boomer_pain_1.wav",
	"darkborn/screamer/voice/pain/male_boomer_pain_2.wav",
	"darkborn/screamer/voice/pain/male_boomer_pain_3.wav",
	"darkborn/screamer/voice/pain/male_boomer_painshort_02.wav",
	"darkborn/screamer/voice/pain/male_boomer_painshort_03.wav",
	"darkborn/screamer/voice/pain/male_boomer_painshort_04.wav",
	"darkborn/screamer/voice/pain/male_boomer_painshort_05.wav",
	"darkborn/screamer/voice/pain/male_boomer_painshort_06.wav",
	"darkborn/screamer/voice/pain/male_boomer_painshort_07.wav",
}

ENT.VomitSound = "darkborn/screamer/explode/explo_medium_09.wav"

util.AddNetworkString("vj_l4d_screamer_hud")
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCallForHelp(ally)
        self:VJ_ACT_PLAYACTIVITY("vjges_Vomit_Attack",false,false,true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply)
    net.Start("vj_l4d_screamer_hud")
		net.WriteBool(false)
		net.WriteEntity(self)
    net.Send(ply)

	function self.VJ_TheControllerEntity:CustomOnStopControlling()
		net.Start("vj_l4d_screamer_hud")
			net.WriteBool(true)
			net.WriteEntity(self)
		net.Send(ply)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ScreamerEffect(pos,range,dontusedot)
	local tbEnts = {}
	for _,v in pairs(ents.FindInSphere(pos,range)) do
		if (v:IsNPC() && v != self) || v:IsPlayer() && GetConVarNumber("ai_ignoreplayers") == 0 then
		util.ScreenShake(v:GetPos(),14,100,1,500)
			local dot = (self:GetPos():Dot(((v:GetPos() +v:OBBCenter()) -self:GetPos()):GetNormalized()) > math.cos(math.rad(40)))
			if dontusedot then
				dot = true
			end
			if !dot then return end
			if v.VJ_NPC_Class && VJ_HasValue(v.VJ_NPC_Class,"CLASS_ZOMBIE") then
				//
			else
				local dmginfo = DamageInfo()
				dmginfo:SetDamage(2)
				dmginfo:SetAttacker(self)
				dmginfo:SetInflictor(self)
				dmginfo:SetDamageType(DMG_SONIC)
				v:TakeDamageInfo(dmginfo)
				if !v.VJ_L4D1_ScreamerEffect then
					if v:IsPlayer() then end
					table.insert(tbEnts,v)
				end
			end
		end
	end
	for i = 1,#tbEnts do
		local ent = tbEnts[i]
		ent.VJ_L4D1_ScreamerEffect = true
		ent:SetNW2Bool("VJ_L4D1_ScreamerEffect",true)
		if ent:IsPlayer() then
			ent:SetDSP(133,false)
		end
		for _, x in ipairs(ents.FindInSphere(ent:GetPos(),4000)) do
			if x:IsNPC() && string.find(x:GetClass(),"npc_vj_l4d_com_") then
				table.insert(x.VJ_AddCertainEntityAsEnemy,ent)
				x:AddEntityRelationship(ent,D_HT,99)
				x.MyEnemy = ent
				x:SetEnemy(ent)
			end
		end
		timer.Simple(5,function()
			if IsValid(ent) then
				ent.VJ_L4D1_ScreamerEffect = false
				ent:SetNW2Bool("VJ_L4D1_ScreamerEffect",false)
				if ent:IsPlayer() then
					ent:SetDSP(0,false)
				end
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	-- print(key)
	if key == "step" then
		self:FootStepSoundCode()
	end
	if key == "melee" then
		self:MeleeAttackCode()
	end
	if key == "vomit" then
		--ParticleEffectAttach("screamer_vomit",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		VJ_CreateSound(self,self.VomitSound,75,100)
		self:SetNW2Int("NextSpecialT",CurTime() +30)
		for i = 1,9 do
			timer.Simple(i *0.3,function()
				if IsValid(self) then
					self:ScreamerEffect(self:GetPos() +self:GetForward() *1,280)
				end
			end)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	sound.Play("darkborn/screamer/voice/vomit/male_boomer_disruptvomit_05.wav",self:GetPos(),100,100)
	util.ScreenShake(GetCorpse:GetPos(),14,100,1,500)
	self:ScreamerEffect(GetCorpse:GetPos(),400,true)
	for _,v in pairs(ents.FindInSphere(GetCorpse:GetPos(),400)) do
		if IsValid(v:GetPhysicsObject()) && v != GetCorpse then
			v:SetGroundEntity(NULL)
			v:SetVelocity(((v:GetPos() +v:OBBCenter()) -(GetCorpse:GetPos() +GetCorpse:OBBCenter())):GetNormalized() *500)
			v:GetPhysicsObject():SetVelocity(((v:GetPos() +v:OBBCenter()) -(GetCorpse:GetPos() +GetCorpse:OBBCenter())):GetNormalized() *600)
		end
	end
	--ParticleEffectAttach("screamer_explode",PATTACH_POINT_FOLLOW,GetCorpse,GetCorpse:LookupAttachment("origin"))
end
/*-----------------------------------------------
	*** Copyright (c) 2021 by Cpt. Hazama, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/