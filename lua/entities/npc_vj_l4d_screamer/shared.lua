ENT.Base 			= "npc_vj_l4d2_boomer" -- Change the base to whatever NPC this will run off of!
ENT.Type 			= "ai"
ENT.PrintName 		= "Screamer"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Left 4 Dead"

ENT.VJ_L4D2_SpecialInfected = true

if CLIENT then
	net.Receive("vj_l4d_screamer_hud",function(len,pl)
		local delete = net.ReadBool()
		local ent = net.ReadEntity()
		if !IsValid(ent) then delete = true end
		hook.Add("HUDPaint","VJ_L4D_Screamer_HUD",function()
			local icon = "hud/l4d1/pz_charge_screamer"
			local size = 200
			local posX = ScrW() -size
			local posY = ScrH() -size +50
			local opp = IsValid(ent) && ent:GetNW2Int("NextSpecialT") -CurTime() or 0
			if IsValid(ent) && ent:GetNW2Int("NextSpecialT") < CurTime() then
				opp = 1
			end

			surface.SetMaterial(Material("hud/l4d2/bg.png"))
			surface.SetDrawColor(Color(255,255,255,255))
			surface.DrawTexturedRect(0,0,ScrW(),ScrH())
			
			local background = surface.GetTextureID("hud/l4d2/pz_charge_bg")
			surface.SetTexture(background)
			surface.SetDrawColor(255,255,255,255)
			surface.DrawTexturedRectRotated(posX,posY,size *1.25,size *1.25,0)

			local background = surface.GetTextureID(icon)
			surface.SetTexture(background)
			if opp != 1 then
				surface.SetDrawColor(255,255,255,255 /opp)
			else
				surface.SetDrawColor(255,255,255,math.abs(math.sin(CurTime() *3) *255))
			end
			surface.DrawTexturedRectRotated(posX,posY,size,size,0)
		end)
		if delete == true then hook.Remove("HUDPaint","VJ_L4D_Screamer_HUD") end

		hook.Add("RenderScreenspaceEffects","VJ_L4D2_Vision",function()
			local tab_infected = {
				["$pp_colour_addr"] = 0.4,
				["$pp_colour_addg"] = 0.375,
				["$pp_colour_addb"] = 0,
				["$pp_colour_brightness"] = -0.4,
				["$pp_colour_contrast"] = 2.55,
				["$pp_colour_colour"] = 0.6,
				["$pp_colour_mulr"] = 0,
				["$pp_colour_mulg"] = 0,
				["$pp_colour_mulb"] = 0
			}
			local tab_ghost = {
				["$pp_colour_addr"] = 0.1,
				["$pp_colour_addg"] = 0.6,
				["$pp_colour_addb"] = 0.8,
				["$pp_colour_brightness"] = -0.3,
				["$pp_colour_contrast"] = 0.8,
				["$pp_colour_colour"] = 1,
				["$pp_colour_mulr"] = 0.5,
				["$pp_colour_mulg"] = 0.5,
				["$pp_colour_mulb"] = 1
			}
			if IsValid(ent) && ent:GetNW2Bool("Ghost") then
				DrawColorModify(tab_ghost)
			else
				DrawColorModify(tab_infected)
			end
		end)
		if delete == true then hook.Remove("RenderScreenspaceEffects","VJ_L4D2_Vision") end

		hook.Add("PreDrawHalos","VJ_L4D2_Halo",function()
			if IsValid(ent) && !ent:GetNW2Float("NextSpecialT") then return end
			local tbGhost = {}
			local tbFriends = {}
			local tbEnemies = {}
			for _,v in pairs(ents.GetAll()) do
				if v:IsNPC() or v:IsPlayer() then
					if v:IsNPC() && (string.find(v:GetClass(),"npc_vj_l4d2") or string.find(v:GetClass(),"npc_vj_l4d")) then
						if IsValid(v) && v:GetNW2Bool("Ghost") then
							table.insert(tbGhost,v)
						else
							table.insert(tbFriends,v)
						end
					else
						if v:GetClass() != "obj_vj_bullseye" then
							table.insert(tbEnemies,v)
						end
					end
				end
			end
			halo.Add(tbGhost,Color(0,0,140),4,4,3,true,true)
			halo.Add(tbFriends,Color(255,75,0),4,4,3,true,true)
			halo.Add(tbEnemies,Color(80,200,0),4,4,3,true,true)
		end)
		if delete == true then hook.Remove("PreDrawHalos","VJ_L4D2_Halo") end
	end)

	function ENT:Think()
		local ply = LocalPlayer()
		if ply.VJ_L4D2_ScreamerEchoT == nil then ply.VJ_L4D2_ScreamerEchoT = 0 end
		local ghost = self:GetNW2Bool("Ghost")
		local track = "cpthazama/bacteria/boomerbacteria.wav"
		if ghost then
			track = "cpthazama/bacteria/boomerbacterias.wav"
		end
		if CurTime() > ply.VJ_L4D2_ScreamerEchoT then
			ply:EmitSound(track,0.2,100)
			ply.VJ_L4D2_ScreamerEchoT = CurTime() +SoundDuration(track) +math.Rand(25,45)
		end
	end
end