AddCSLuaFile("cl_hud.lua")
include("shared.lua")
include("player.lua")
include( "player_state.lua" )
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_scoreboard.lua")
AddCSLuaFile("cl_deathnotice.lua")




local models = 
{
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl"


}


-- I know that the TAB key is a thing. Don't hurt me pls
function GM:PlayerSpawn(ply) -- When player spawn



	if ply:IsUserGroup( "user" ) && ply:Team() != 2 then
		ply:SetGravity(.80)
		ply:SetMaxHealth(100)
		ply:SetRunSpeed(450)
		ply:SetWalkSpeed(250)
		ply:StripAmmo()
		ply:StripWeapons()
		ply.SuicideCount = 0 -- Reset suicides
		ply:Give("weapon_crowbar")
		ply:Give("weapon_physcannon")
		ply:Give("weapon_pistol")
		ply:Give("item_suit")
		ply:Give("item_ammo_pistol_large")
		ply:SetupHands()
	end
	if ply:IsUserGroup( "assault" )  && ply:Team() != 2 then
		ply:SetGravity(.80)
		ply:SetMaxHealth(100)
		ply:SetRunSpeed(450)
		ply:SetWalkSpeed(250)
		ply:StripAmmo()
		ply:StripWeapons()
		ply.SuicideCount = 0 -- Reset suicides
		ply:Give("weapon_crowbar")
		ply:Give("weapon_physcannon")
		ply:Give("weapon_pistol")
		ply:Give("weapon_shotgun")
		ply:Give("weapon_smg1")
		ply:Give("item_ammo_smg1_large")
		ply:Give("item_ammo_smg1_large")
		ply:Give("item_ammo_smg1_grenade")
		ply:Give("item_ammo_smg1_grenade")
		ply:Give("item_box_buckshot")
		ply:Give("item_box_buckshot")
		ply:Give("item_suit")
		ply:Give("item_ammo_pistol_large")
		ply:Give("item_ammo_pistol_large")
		ply:SetupHands()
	
	end
	if ply:IsUserGroup( "heavy" ) && ply:Team() != 2 then
		ply:SetGravity(.80)
		ply:SetMaxHealth(100)
		ply:SetRunSpeed(225)
		ply:SetWalkSpeed(125)
		ply:StripAmmo()
		ply:StripWeapons()
		ply.SuicideCount = 0 -- Reset suicides
		ply:Give("weapon_crowbar")
		ply:Give("weapon_physcannon")
		ply:Give("weapon_pistol")
		ply:Give("item_suit")
		ply:Give("item_ammo_pistol_large")
		ply:Give("item_ammo_pistol_large")
		ply:Give("weapon_rpg")
		ply:Give("weapon_frag")
		ply:GiveAmmo( 3, "Grenade")
		ply:Give("weapon_ar2")
		ply:Give("item_ammo_ar2_large")
		ply:SetupHands()
	
	end
	if ply:IsUserGroup( "scavenger" ) && ply:Team() != 2 then
		ply:SetGravity(.80)
		ply:SetMaxHealth(100)
		ply:SetRunSpeed(562.5)
		ply:SetWalkSpeed(312.5)
		ply:StripAmmo()
		ply:StripWeapons()
		ply.SuicideCount = 0 -- Reset suicides
		ply:Give("weapon_crowbar")
		ply:Give("weapon_physcannon")
		ply:Give("weapon_pistol")
		ply:Give("item_suit")
		ply:Give("item_ammo_pistol_large")
		ply:Give("item_ammo_pistol_large")
		ply:Give("weapon_357")
		ply:Give("weapon_crossbow")
		ply:Give("item_ammo_crossbow")
		ply:Give("item_ammo_357_large")
		ply:SetupHands()
	
	end
end

local GodMode = {
	Settings = {
		Length = 3
	}
}

function test(time)

	round.TimeLeft = time

end

function GodMode:PlayerSpawn(ply)if !IsValid(ply) then return end -- https://gmod.facepunch.com/f/gmoddev/ltax/Spawn-protection/1/
	
	ply:GodEnable()
	ply.GodEnabled = true
	
	timer.Simple(self.Settings.Length, function()if !IsValid(ply) then return end
		ply:GodDisable()
		ply.GodEnabled = false end)
end
hook.Add("PlayerSpawn", "GE.PlayerSpawn", function(...) GodMode:PlayerSpawn(...)
 end)


hook.Add( "EntityTakeDamage", "ExtraDamage", function( target, dmginfo )
		entities = ents.FindByClass("func_breakable")
		local ply = dmginfo:GetAttacker()
		if IsValid( ply ) and ply:IsPlayer()  then
			local wep = ply:GetActiveWeapon()
			if wep and wep:GetClass() == "weapon_crowbar" then
				if	ply:IsUserGroup("heavy") then
						if !target:IsPlayer() && !target:IsNPC()  then
							dmginfo:ScaleDamage( 0.5 )
						end
				elseif ply:IsUserGroup("scavenger") then
					if !target:IsPlayer() && !target:IsNPC()  then
							dmginfo:ScaleDamage( 1.25 )
					end
				end
			end
		end
end )


function GM:PlayerConnect( name, ip ) -- When player connects
    print("Player: " ..name.. " has joined the battle.")
	timer.Start("respawntime")
end


function GM:PlayerInitialSpawn( ply ) -- First spawn
ply:ConCommand( "TeamMenu" )		


	ply:Spectate(6)
	ply:SetTeam(2)




timer.Simple(1, function() --Wait till the player actually spawns.
            ply:SetModel( table.Random(models) )
			ply:Spectate(6)
			ply:SetTeam(2)
			ply:StripWeapons()
			ply:StripAmmo()
      end)
	
	 for k,v in pairs(player.GetAll()) do
		v:ChatPrint( "Player "..ply:GetName().." Joined team " .. team.GetName( ply:Team() ) .. "." )
	end


end

function GM:PlayerSetModel( ply )
    ply:SetModel( table.Random(models) )
end

util.AddNetworkString("ChangeTeamRed")	
net.Receive("ChangeTeamRed",function( len, pl )
     pl:UnSpectate() -- unspectate the player
	 pl:SetGamemodeTeam(0) -- Team 1 (Red)
	 pl:StripAmmo()
	 pl:StripWeapons()
	 pl:SetUserGroup( "user" )
	 pl:Spawn()
	 pl.SuicideCount = 0 -- Reset suicides
	 for k,v in pairs(player.GetAll()) do
		v:ChatPrint( "Player "..pl:GetName().." Joined team " .. team.GetName( pl:Team() ) .. "." )
	end
end)


function GM:CanPlayerSuicide( ply )
	return ply:Team() == 1 or ply:Team() == 0
end



util.AddNetworkString("ChangeTeamBlue")	
net.Receive("ChangeTeamBlue",function( len, pl )
      pl:UnSpectate() -- unspectate the player
	 pl:SetGamemodeTeam(1) -- Team 1 (Red)
	 pl:StripAmmo()
	 pl:StripWeapons()
	pl:SetUserGroup( "user" )
	 pl:Spawn()
	 pl.SuicideCount = 0 -- Reset suicides
	 for k,v in pairs(player.GetAll()) do
		v:ChatPrint( "Player "..pl:GetName().." Joined team " .. team.GetName( pl:Team() ) .. "." )
	end
end) 	 

util.AddNetworkString("ChangeTeamSpec")	
net.Receive("ChangeTeamSpec",function( len, ply )
     ply:SetGamemodeTeam(2)
     ply.SuicideCount = 0
	 ply:Spectate(6)
	 ply:StripWeapons()
	 ply:StripAmmo()
	 for k,v in pairs(player.GetAll()) do
		v:ChatPrint( "Player "..ply:GetName().." Joined team " .. team.GetName( ply:Team() ) .. "." )
	end
end	) 



round = {}

-- Variables
round.Break	= 20	-- 20 second breaks
round.Time	= 1800	-- 30 minute rounds
round.warmup = 30   -- 30 seconds warmup



-- Read Variables
round.TimeLeft = -1
round.Breaking = false

-- Inspired by Facepunch forums (LuaGuy)

function round.Broadcast(Text)
	for k, v in pairs(player.GetAll()) do
		
		v:ChatPrint(Text)
	end
end

shouldrestartgame = false
scoreboardshow = false

function round.Begin()
	-- (zacatek kola)
	round.Broadcast("Round starting! Round ends in " .. string.ToMinutesSeconds(round.Time) .. " minutes!")
	for k, v in pairs(player.GetAll()) do
		round.TimeLeft = round.Time
		v:Freeze( false )
			if v:Team() == 0 or v:Team() == 1 then
				v:Spawn()
				v:StripAmmo()
			end
		v:ConCommand("play buttons/button17.wav")
		if shouldrestartgame == false then
			game.CleanUpMap()
		else
			game.ConsoleCommand("changelevel bs_greenfields\n")
		end
	end
	round.warmup = false
	
end
util.AddNetworkString( "pat" )
function round.End() -- End of the round
	round.Broadcast("Nobody wins! Next round in " .. round.Break .. " seconds!")
	for k, v in pairs( player.GetAll() ) do
		timer.Start("respawnhandle")
		round.TimeLeft = round.Break
		net.Start("pat")
		net.Send(v)
		v:ConCommand("play basebuild/game-lose.wav")
		shouldrestartgame = true
	end

end

red_win_bool = false

util.AddNetworkString( "red_win_panel" )
function red_win()
	round.Broadcast("Red team wins! Next round in " .. round.Break .. " seconds!")
	red_win_bool = true
	for k, v in pairs( player.GetAll() ) do
		round.TimeLeft = round.Break
		shouldrestartgame = true
		net.Start("red_win_panel")
		net.Send(v)
		if v:Team() == 0 or v:Team() == 2 then
			v:ConCommand("play basebuild/game-win.wav")
		elseif v:Team() == 1 then
			v:ConCommand("play basebuild/game-lose.wav")
		end
	end

end

util.AddNetworkString( "blue_win_panel" )
function blue_win()
	round.Broadcast("Red team wins! Next round in " .. round.Break .. " seconds!")
	blue_win_bool = true
	for k, v in pairs( player.GetAll() ) do
		round.TimeLeft = round.Break
		shouldrestartgame = true
		net.Start("blue_win_panel")
		net.Send(v)
		if v:Team() == 1 or v:Team() == 2 then
			v:ConCommand("play basebuild/game-win.wav")
		elseif v:Team() == 0 then
			v:ConCommand("play basebuild/game-lose.wav")
		end
	end

end

function round.Handle()
	if (round.TimeLeft == -1) then -- First round start
	round.Broadcast("Warmup! Round starting in ".. round.warmup .." seconds!")
	for k, v in pairs( player.GetAll() ) do
	round.TimeLeft = round.warmup
	
	v:ConCommand("play buttons/button17.wav")
end
		return
	end
	
	round.TimeLeft = round.TimeLeft - 1
	
	
	if (round.TimeLeft == 0) then
		if (round.Breaking) or (round.warmup) or (red_win_bool) or (blue_win_bool) then
			round.Begin()
			round.Breaking = false
		else
			round.End()
			round.Breaking = true
		end
	end
end
timer.Create("round.Handle", 1, 0, round.Handle)

function GM:PlayerSelectSpawn( pl ) -- random spawn select
local TEAM_1 = ents.FindByClass("info_target")
local TEAM_2 = ents.FindByClass("info_player_start")
local TEAM_SPEC = ents.FindByName("spectator")


    local random_1 = math.random(#TEAM_1)
	local random_2 = math.random(#TEAM_2)
	local random_3 = math.random(#TEAM_SPEC)
	
for k,v in pairs(player.GetAll()) do 
	if pl:Team() == 0 then
		return TEAM_1[random_1]
	elseif pl:Team() == 1 then
		return TEAM_2[random_2]
	elseif pl:Team() == 2 then
		return TEAM_SPEC[0]
	end
end
	
 
end

function GM:PlayerSwitchFlashlight(ply, SwitchOn)
	if ply:Team() == 1 or ply:Team() == 0 then
		return true
	else
		return false

	end
end


function GM:ShowTeam( ply )
	ply:ConCommand( "TeamMenu" )

end



function GM:PlayerDeathThink( pl )



end

local function up( ply, ent )
	return ply:Team() == 1 or ply:Team() == 0
end
hook.Add( "AllowPlayerPickup", "cantPickUp", up )



function GM:Think() -- set global variables



    local ply = FindMetaTable("Player")
    SetGlobalInt("round.TimeLeft", round.TimeLeft)
	SetGlobalInt("round.Time", round.Time)
	SetGlobalInt( "RedTeamNum", team.NumPlayers( 0, TEAM_1 ) )
	SetGlobalInt( "SpecTeamNum", team.NumPlayers( 2, TEAM_SPEC ) )
    SetGlobalInt( "respawntime", timerleft )
	SetGlobalInt( "BlueTeamNum", team.NumPlayers( 1, TEAM_2 ) )
	SetGlobalInt("round.Break", round.Break)
	
	
	-- To keep track of tower's HP, we need to refresh it 
			
	local tower1 = ents.FindByName("final_tower_part_one")
	local tower2 = ents.FindByName("final_tower_part_two")
	local tower3 = ents.FindByName("final_tower_part_three")
	local tower4 = ents.FindByName("final_tower_part_four")
	local tower5 = ents.FindByName("final_tower_part_five")
	local tower1_blue = ents.FindByName("final_tower_part_one_blue")
	local tower2_blue = ents.FindByName("final_tower_part_two_blue")
	local tower3_blue = ents.FindByName("final_tower_part_three_blue")
	local tower4_blue = ents.FindByName("final_tower_part_four_blue")
	local tower5_blue = ents.FindByName("final_tower_part_five_blue")
	
	if tower1[1] != nil then
	
		local tower1_entity = tower1[1]:Health()
		SetGlobalInt("tower1_entity", tower1_entity)
	else
		local tower1_entity = 0
		SetGlobalInt("tower1_entity", tower1_entity)
	end
	
	if tower2[1] != nil then
	
		local tower2_entity = tower2[1]:Health()
		SetGlobalInt("tower2_entity", tower2_entity)
		else
		local tower2_entity = 0
		SetGlobalInt("tower2_entity", tower2_entity)
	end
	
		
	if tower3[1] != nil then
	
		local tower3_entity = tower3[1]:Health()
		SetGlobalInt("tower3_entity", tower3_entity)
			else
		local tower3_entity = 0
		SetGlobalInt("tower3_entity", tower3_entity)

	end
	
		
	if tower4[1] != nil then
	
		local tower4_entity = tower4[1]:Health()
		SetGlobalInt("tower4_entity", tower4_entity)
			else
		local tower4_entity = 0
		SetGlobalInt("tower4_entity", tower4_entity)

	end
	
		
	if tower5[1] != nil then
	
		local tower5_entity = tower5[1]:Health()
		SetGlobalInt("tower5_entity", tower5_entity)
			else
		local tower5_entity = 0
		SetGlobalInt("tower5_entity", tower5_entity)

	end
	
		
	if tower1_blue[1] != nil then
	
		local tower1_entity_blue = tower1_blue[1]:Health()
		SetGlobalInt("tower1_entity_blue", tower1_entity_blue)
			else
		local tower1_entity_blue = 0
		SetGlobalInt("tower1_entity_blue", tower1_entity_blue)

	end
	
	if tower2_blue[1] != nil then
	
		local tower2_entity_blue = tower2_blue[1]:Health()
		SetGlobalInt("tower2_entity_blue", tower2_entity_blue)
				else
		local tower2_entity_blue = 0
		SetGlobalInt("tower2_entity_blue", tower2_entity_blue)

	end
	
	if tower3_blue[1] != nil then
	
		local tower3_entity_blue = tower3_blue[1]:Health()
		SetGlobalInt("tower3_entity_blue", tower3_entity_blue)
				else
		local tower3_entity_blue = 0
		SetGlobalInt("tower3_entity_blue", tower3_entity_blue)

	end
	
	if tower4_blue[1] != nil then
	
		local tower4_entity_blue = tower4_blue[1]:Health()
		SetGlobalInt("tower4_entity_blue", tower4_entity_blue)
				else
		local tower4_entity_blue = 0
		SetGlobalInt("tower4_entity_blue", tower4_entity_blue)

	end
	
	if tower5_blue[1] != nil then
	
		local tower5_entity_blue = tower5_blue[1]:Health()
		SetGlobalInt("tower5_entity_blue", tower5_entity_blue)
				else
		local tower5_entity_blue = 0
		SetGlobalInt("tower5_entity_blue", tower5_entity_blue)

	end
	
 -- i dun goofed, hope i didnt killed my fps
	
end


-- Respawn timer

local maxdeathtime = 10; -- Respawn time (seconds)
 
function player_initdeath( ply, wep, killer )
 
     ply.nextspawn = CurTime() + maxdeathtime;
end
hook.Add( "PlayerDeath", "player_initalize_dvars", player_initdeath );
hook.Add( "PlayerSilentDeath", "player_initalize_dvars_silent", player_initdeath );
 
function playerforcerespawn( ply )
 
     if (CurTime()>=ply.nextspawn) then
          ply:Spawn()
          ply.nextspawn = math.huge
     end
 
end
hook.Add( "PlayerDeathThink", "player_step_forcespawn", playerforcerespawn );


hook.Add("PlayerShouldTakeDamage", "Friendly fire", function(victim, attacker)
	if attacker:IsPlayer() then
		if victim:Team() == attacker:Team() and victim != attacker then 
			return false 
		end
	end
end)


function GM:PlayerDeath( victim, inflictor, attacker )

if ( attacker:IsValid() && attacker:IsPlayer() ) then

		if victim == attacker then
			attacker:AddFrags( 0 )
	
		end
end



victim.NextSpawnTime = CurTime() + 2
	victim.DeathTime = CurTime()
	
	if ( IsValid( attacker ) && attacker:GetClass() == "trigger_hurt" ) then attacker = victim end
	
	if ( IsValid( attacker ) && attacker:IsVehicle() && IsValid( attacker:GetDriver() ) ) then
		attacker = attacker:GetDriver()
	end

	if ( !IsValid( inflictor ) && IsValid( attacker ) ) then
		inflictor = attacker
	end

	-- Convert the inflictor to the weapon that they're holding if we can.
	-- This can be right or wrong with NPCs since combine can be holding a
	-- pistol but kill you by hitting you with their arm.
	if ( IsValid( inflictor ) && inflictor == attacker && ( inflictor:IsPlayer() || inflictor:IsNPC() ) ) then
	
		inflictor = inflictor:GetActiveWeapon()
		if ( !IsValid( inflictor ) ) then inflictor = attacker end

	end

	if ( attacker == victim ) then
	
		net.Start( "PlayerKilledSelf" )
			net.WriteEntity( victim )
		net.Broadcast()
		
		MsgAll( attacker:Nick() .. " suicided!\n" )
		
	return end

	if ( attacker:IsPlayer() ) then
	
		net.Start( "PlayerKilledByPlayer" )
		
			net.WriteEntity( victim )
			net.WriteString( inflictor:GetClass() )
			net.WriteEntity( attacker )
		
		net.Broadcast()
		
		MsgAll( attacker:Nick() .. " killed " .. victim:Nick() .. " using " .. inflictor:GetClass() .. "\n" )
		
	return end
	
	net.Start( "PlayerKilled" )
	
		net.WriteEntity( victim )
		net.WriteString( inflictor:GetClass() )
		net.WriteString( attacker:GetClass() )

	net.Broadcast()
	
	MsgAll( victim:Nick() .. " was killed by " .. attacker:GetClass() .. "\n" )


end

function GM:PlayerSilentDeath( Victim )

	Victim.NextSpawnTime = CurTime() + 2
	Victim.DeathTime = CurTime()

end

function GM:PlayerDisconnected( ply )

	print( "Player: " .. ply:Nick() .. " has disconnected." )

	PrintMessage( HUD_PRINTTALK, Format( "Player %s has disconnected.", ply:Nick() ) )
end



util.AddNetworkString( "alert_one" )
function first_alert()
	for k,v in pairs(player.GetAll()) do 
			v:ConCommand("play basebuild/achievement.wav")
			net.Start("alert_one")
			net.Send(v)
	end

end

util.AddNetworkString( "destroy_alert" )
function destroy_alert()
	for k,v in pairs(player.GetAll()) do 
			v:ConCommand("play basebuild/fail.wav")
			net.Start("destroy_alert")
			net.Send(v)
	end

end

util.AddNetworkString( "alert_one_blue" )
function first_alert_blue()
	for k,v in pairs(player.GetAll()) do 
			v:ConCommand("play basebuild/achievement.wav")
			net.Start("alert_one_blue")
			net.Send(v)
	end

end

util.AddNetworkString( "destroy_alert_blue" )
function destroy_alert_blue()
	for k,v in pairs(player.GetAll()) do 
			v:ConCommand("play basebuild/fail.wav")
			net.Start("destroy_alert_blue")
			net.Send(v)
	end

end

class_red = false -- Global class variable
assault_red = false -- Red classes
heavy_red = false
scav_red = false
class_blue = false
assault_blue = false -- Blue classes
heavy_blue = false
scav_blue = false


function class_selection_red() -- When players research the class system, this function gets called. We now need to enable the derma shortcut, create the derma itself and then add room for expansion
	class_red = true
	for k,v in pairs(player.GetAll()) do 
		if v:Team() == 0 then
			v:ChatPrint("You have now researched a class selection system! To see the menu, press F4")
			v:ConCommand("play basebuild/achievement.wav")
		end
	end
end

function class_selection_blue() -- When players research the class system, this function gets called. We now need to enable the derma shortcut, create the derma itself and then add room for expansion
	class_blue = true
	for k,v in pairs(player.GetAll()) do 
		if v:Team() == 1 then
			v:ChatPrint("You have now researched a class selection system! To see the menu, press F4")
			v:ConCommand("play basebuild/achievement.wav")
		end
	end
end

function assault_red_unlock()
	assault_red = true
	SetGlobalBool("assault_red", assault_red)
end

function assault_blue_unlock()
	assault_blue = true
	SetGlobalBool("assault_blue", assault_blue)
end

function heavy_red_unlock()
	heavy_red = true
	SetGlobalBool("heavy_red", heavy_red)
end

function heavy_blue_unlock()
	heavy_blue = true
	SetGlobalBool("heavy_blue", heavy_blue)
end

function scav_red_unlock()
	scav_red = true
	SetGlobalBool("scav_red", scav_red)
end

function scav_blue_unlock()
	scav_blue = true
	SetGlobalBool("scav_blue", scav_blue)
end

util.AddNetworkString( "class_selection" )
function GM:ShowSpare2(ply)
		if class_red == true && ply:Team() == 0 then
			net.Start("class_selection")
			net.Send(ply)
	
	elseif class_blue == true && ply:Team() == 1 then
		net.Start("class_selection")
		net.Send(ply)
	end

end



util.AddNetworkString("Class_assault")	
net.Receive("Class_assault",function( len, ply )

	 ply:SetUserGroup( "assault" )
	  ply:KillSilent()
	 for k,v in pairs(player.GetAll()) do
		v:ChatPrint( "Player "..ply:GetName().." Changed class to assault" )
	end
end)

util.AddNetworkString("Class_heavy")	
net.Receive("Class_heavy",function( len, ply )
	 ply:SetUserGroup( "heavy" )
    ply:KillSilent()
	 
	 for k,v in pairs(player.GetAll()) do
		v:ChatPrint( "Player "..ply:GetName().." Changed class to heavy" )
	end
end)

util.AddNetworkString("Class_scavenger")	
net.Receive("Class_scavenger",function( len, ply )
	 ply:SetUserGroup( "scavenger" )
    ply:KillSilent()
	 
	 for k,v in pairs(player.GetAll()) do
		v:ChatPrint( "Player "..ply:GetName().." Changed class to scavenger" )
	end
end)

