AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/darkborn/l4d2/common/common_female_tanktop_jeans.mdl"} 
	-- ====== File Path Variables ====== --
	-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {"vj_l4d_com/idle/mumbling01.wav","vj_l4d_com/idle/mumbling02.wav","vj_l4d_com/idle/mumbling03.wav","vj_l4d_com/idle/mumbling04.wav","vj_l4d_com/idle/mumbling05.wav","vj_l4d_com/idle/mumbling06.wav","vj_l4d_com/idle/mumbling07.wav","vj_l4d_com/idle/mumbling08.wav","vj_l4d_com/idle/moan01.wav","vj_l4d_com/idle/moan02.wav","vj_l4d_com/idle/moan03.wav","vj_l4d_com/idle/moan04.wav","vj_l4d_com/idle/moan05.wav","vj_l4d_com/idle/moan06.wav","vj_l4d_com/idle/moan07.wav","vj_l4d_com/idle/moan08.wav","vj_l4d_com/idle/moan09.wav"}
ENT.SoundTbl_CombatIdle = {"vj_l4d_com/idle_combat/alert24.wav","vj_l4d_com/idle_combat/become_enraged01.wav","vj_l4d_com/idle_combat/become_enraged02.wav","vj_l4d_com/idle_combat/become_enraged03.wav","vj_l4d_com/idle_combat/become_enraged06.wav","vj_l4d_com/idle_combat/become_enraged07.wav","vj_l4d_com/idle_combat/become_enraged09.wav","vj_l4d_com/idle_combat/become_enraged10.wav","vj_l4d_com/idle_combat/become_enraged11.wav","vj_l4d_com/idle_combat/become_enraged30.wav","vj_l4d_com/idle_combat/become_enraged50.wav","vj_l4d_com/idle_combat/become_enraged51.wav","vj_l4d_com/idle_combat/become_enraged52.wav","vj_l4d_com/idle_combat/become_enraged53.wav","vj_l4d_com/idle_combat/become_enraged54.wav","vj_l4d_com/idle_combat/become_enraged55.wav","vj_l4d_com/idle_combat/become_enraged56.wav","vj_l4d_com/idle_combat/become_enraged57.wav","vj_l4d_com/idle_combat/become_enraged58.wav","vj_l4d_com/idle_combat/female/become_enraged40.wav","vj_l4d_com/idle_combat/female/become_enraged41.wav","vj_l4d_com/idle_combat/female/become_enraged42.wav","vj_l4d_com/idle_combat/female/become_enraged43.wav"}
ENT.SoundTbl_Investigate = {"vj_l4d_com/investigate/become_alert01.wav","vj_l4d_com/investigate/become_alert04.wav","vj_l4d_com/investigate/become_alert09.wav","vj_l4d_com/investigate/become_alert11.wav","vj_l4d_com/investigate/become_alert12.wav","vj_l4d_com/investigate/become_alert14.wav","vj_l4d_com/investigate/become_alert17.wav","vj_l4d_com/investigate/become_alert18.wav","vj_l4d_com/investigate/become_alert21.wav","vj_l4d_com/investigate/become_alert23.wav","vj_l4d_com/investigate/become_alert25.wav","vj_l4d_com/investigate/become_alert26.wav","vj_l4d_com/investigate/become_alert29.wav","vj_l4d_com/investigate/become_alert38.wav","vj_l4d_com/investigate/become_alert41.wav","vj_l4d_com/investigate/become_alert54.wav","vj_l4d_com/investigate/become_alert55.wav","vj_l4d_com/investigate/become_alert56.wav","vj_l4d_com/investigate/become_alert57.wav","vj_l4d_com/investigate/become_alert58.wav","vj_l4d_com/investigate/become_alert59.wav","vj_l4d_com/investigate/female/become_alert60.wav","vj_l4d_com/investigate/female/become_alert61.wav","vj_l4d_com/investigate/female/become_alert62.wav","vj_l4d_com/investigate/female/become_alert63.wav"}
ENT.SoundTbl_Alert = {"vj_l4d_com/alert/shout02.wav","vj_l4d_com/alert/shout03.wav","vj_l4d_com/alert/shout04.wav","vj_l4d_com/alert/shout06.wav","vj_l4d_com/alert/shout07.wav","vj_l4d_com/alert/shout08.wav","vj_l4d_com/alert/shout09.wav","vj_l4d_com/alert/recognize01.wav","vj_l4d_com/alert/recognize02.wav","vj_l4d_com/alert/recognize03.wav","vj_l4d_com/alert/recognize04.wav","vj_l4d_com/alert/recognize05.wav","vj_l4d_com/alert/recognize06.wav","vj_l4d_com/alert/recognize07.wav","vj_l4d_com/alert/recognize08.wav","vj_l4d_com/alert/alert16.wav","vj_l4d_com/alert/alert26.wav","vj_l4d_com/alert/alert37.wav","vj_l4d_com/alert/alert38.wav","vj_l4d_com/alert/alert39.wav","vj_l4d_com/alert/alert40.wav","vj_l4d_com/alert/alert41.wav","vj_l4d_com/alert/alert42.wav","vj_l4d_com/alert/hiss01.wav","vj_l4d_com/alert/female/alert50.wav","vj_l4d_com/alert/female/alert51.wav","vj_l4d_com/alert/female/alert52.wav","vj_l4d_com/alert/female/alert53.wav","vj_l4d_com/alert/female/alert54.wav","vj_l4d_com/alert/female/alert55.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_l4d_com/attack_b/female/rage_50.wav","vj_l4d_com/attack_b/female/rage_51.wav","vj_l4d_com/attack_b/female/rage_52.wav","vj_l4d_com/attack_b/female/rage_53.wav","vj_l4d_com/attack_b/female/rage_54.wav","vj_l4d_com/attack_b/female/rage_55.wav","vj_l4d_com/attack_b/female/rage_56.wav","vj_l4d_com/attack_b/female/rage_57.wav","vj_l4d_com/attack_b/female/rage_58.wav","vj_l4d_com/attack_b/female/rage_59.wav","vj_l4d_com/attack_b/female/rage_60.wav","vj_l4d_com/attack_b/female/rage_61.wav","vj_l4d_com/attack_b/female/rage_62.wav","vj_l4d_com/attack_b/female/rage_64.wav","vj_l4d_com/attack_b/female/rage_65.wav","vj_l4d_com/attack_b/female/rage_66.wav","vj_l4d_com/attack_b/female/rage_67.wav","vj_l4d_com/attack_b/female/rage_68.wav","vj_l4d_com/attack_b/female/rage_69.wav","vj_l4d_com/attack_b/female/rage_70.wav","vj_l4d_com/attack_b/female/rage_71.wav","vj_l4d_com/attack_b/female/rage_72.wav","vj_l4d_com/attack_b/female/rage_73.wav","vj_l4d_com/attack_b/female/rage_74.wav","vj_l4d_com/attack_b/female/rage_75.wav","vj_l4d_com/attack_b/female/rage_76.wav","vj_l4d_com/attack_b/female/rage_77.wav","vj_l4d_com/attack_b/female/rage_78.wav","vj_l4d_com/attack_b/female/rage_79.wav","vj_l4d_com/attack_b/female/rage_80.wav","vj_l4d_com/attack_b/female/rage_81.wav","vj_l4d_com/attack_b/female/rage_82.wav"}
ENT.SoundTbl_Pain = {"vj_l4d_com/pain/been_shot_02.wav","vj_l4d_com/pain/been_shot_12.wav","vj_l4d_com/pain/been_shot_19.wav","vj_l4d_com/pain/been_shot_20.wav","vj_l4d_com/pain/been_shot_21.wav","vj_l4d_com/pain/female/been_shot_30.wav","vj_l4d_com/pain/female/been_shot_31.wav","vj_l4d_com/pain/female/been_shot_32.wav","vj_l4d_com/pain/female/been_shot_33.wav","vj_l4d_com/pain/female/been_shot_34.wav","vj_l4d_com/pain/female/been_shot_35.wav","vj_l4d_com/pain/female/been_shot_36.wav","vj_l4d_com/pain/female/been_shot_37.wav"}
ENT.SoundTbl_Death = {"vj_l4d_com/death/death_14.wav","vj_l4d_com/death/death_17.wav","vj_l4d_com/death/death_18.wav","vj_l4d_com/death/death_19.wav","vj_l4d_com/death/death_22.wav","vj_l4d_com/death/death_23.wav","vj_l4d_com/death/death_24.wav","vj_l4d_com/death/death_25.wav","vj_l4d_com/death/death_26.wav","vj_l4d_com/death/death_27.wav","vj_l4d_com/death/death_28.wav","vj_l4d_com/death/death_29.wav","vj_l4d_com/death/death_30.wav","vj_l4d_com/death/death_32.wav","vj_l4d_com/death/death_33.wav","vj_l4d_com/death/death_34.wav","vj_l4d_com/death/death_35.wav","vj_l4d_com/death/death_36.wav","vj_l4d_com/death/death_37.wav","vj_l4d_com/death/death_38.wav","vj_l4d_com/death/female/death_40.wav","vj_l4d_com/death/female/death_41.wav","vj_l4d_com/death/female/death_42.wav","vj_l4d_com/death/female/death_43.wav","vj_l4d_com/death/female/death_44.wav","vj_l4d_com/death/female/death_45.wav","vj_l4d_com/death/female/death_46.wav","vj_l4d_com/death/female/death_47.wav","vj_l4d_com/death/female/death_48.wav","vj_l4d_com/death/female/death_49.wav","vj_l4d_com/death/mp/odd_2.wav","vj_l4d_com/death/mp/odd_3.wav","vj_l4d_com/death/mp/odd_4.wav","vj_l4d_com/death/mp/odd_5.wav","vj_l4d_com/death/mp/squeal_1.wav","vj_l4d_com/death/mp/squeal_2.wav","vj_l4d_com/death/mp/squeal_3.wav","vj_l4d_com/death/mp/squeal_4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if self:GetModel() == "models/darkborn/l4d2/common/common_female_tanktop_jeans.mdl" then
		self:SetBodygroup(0,math.random(0,2))
		self:SetBodygroup(1,math.random(0,3))
		
end
        if self:GetModel() == "models/darkborn/l4d2/common/common_female_tshirt_skirt.mdl" then
		self:SetBodygroup(0,math.random(0,3))
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