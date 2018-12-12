AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_rounds.lua")
timerleft = 10


function respawn()
	timerleft = timerleft -1 -- every second (based on timer), the timer will be second less
		if (timerleft == 0) then
			timer.Stop( "respawntime" ) -- stop after 0
		end
end



timer.Create( "screenMonitorSizeChange", 1, 0, function()
	_curscrw = _curscrw or ScrW()
	_curscrh = _curscrh or ScrH()

	if ( _curscrh != ScrH() or _curscrw != ScrW() ) then
		_curscrh = ScrH()
		_curscrw = ScrW()
		hook.Call( "OnScreenSizeChange", GAMEMODE, _curscrw, _curscrh )
	end
end )

 surface.CreateFont( "CustomFont", { -- FONTS
	font = "Times New Roman", 
	extended = false,
	size = 80,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

   surface.CreateFont( "font1", { -- FONTS
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale( 8 ),
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

   surface.CreateFont( "font2", { -- FONTS
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale( 10 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

   surface.CreateFont( "font3", { -- FONTS
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale( 7 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


surface.CreateFont( "Arial", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 22 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "DeathText", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 22 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "DeLarge", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 12 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Ammo", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 22 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Alt", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 14 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

hook.Add( "OnScreenSizeChange", "Ichanged", function( w, h ) -- When user resize his screen, this gets called. Why? Because the ScreenScale() function is called only once. If user somehow resizes his screen, the font size will be called again.
   surface.CreateFont( "CustomFont", { -- FONTS
	font = "Times New Roman", 
	extended = false,
	size = 80,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "classfont1", {
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale(16),
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "classfont2", {
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale(8),
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "classfont", {
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale(24),
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "patfont", {
	font = "Arial", 
	extended = false,
	size = ScreenScale(28),
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "winfont", {
	font = "Arial", 
	extended = false,
	size = ScreenScale(20),
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "winfont2", {
	font = "Arial", 
	extended = false,
	size = ScreenScale(10),
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "namefont", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 8 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "DermaDe", {
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale( 5.8 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "scorefont", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 18 ),
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "namefont", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 8 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


   surface.CreateFont( "font1", { -- FONTS
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale( 8 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

   surface.CreateFont( "font2", { -- FONTS
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale( 10 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

   surface.CreateFont( "font3", { -- FONTS
	font = "Trebuchet MS", 
	extended = false,
	size = ScreenScale( 7 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Arial", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 22 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "DeathText", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 22 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "DeLarge", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 12 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Ammo", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 22 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Alt", {
	font = "Arial", 
	extended = false,
	size = ScreenScale( 14 ),
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "alert_one", {
	font = "Arial", 
	extended = false,
	size = ScreenScale(8),
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
end )

function facts() 
	
	fact = {
	"[F2] to change teams.",
	"You can play by different playstyles. You can either secure your base and build you tower securely, or risk and start building your tower from the start.",
	"Don't forget to research, or you won't progress in buildings.",
	"You don't have to research every building. In fact, the only thing you need to research to win the game is the final tower.",
	"Once you have researched the resupply house, you can open the class selection menu by pressing [F4]. You need to research the classes aswell.",
	"The resources can be obtained either by mining, or you can try to steal some from your opponents.",
	"You should choose your roles. Once you have researched the class system, your team should be doing their task according to their class.",
	"Some resources like stone are heavy to carry. You can always ask your teammates for help.",
	"Iron is a very rare resource. It is all around the map and in the mines. The team that has secured the mines has a big advantage.",
	"There is also iron ore located in the rocks on the map.",
	"There is plenty of wood out there so you can use it for refining in research.",
	"Don't forget that once you build a part of your final tower, it can be destroyed until you build the next part. You should always protect your tower.",
	"If you run out of ammo, there's no way to regain it. Try helping your team by getting resources if you happen to be low on ammo.",
	"The health regenerate upgrade regenerates your health in your base very quickly.",
	"Iron ore in the mines respawns once after it's completely mined.",
	"Higher tower parts can be hard to destroy, keep that in mind while building or while destroying, as it may require a heavy class."
	
	}
    random_facts = math.random(#fact) 
	
	
end

timer.Create("facts_shuffle",1,0,facts)

function HUD()
    local client = LocalPlayer() -- variables
    local ply = FindMetaTable("Player")
	
	local tower1_entity = GetGlobalInt("tower1_entity")
	local tower2_entity = GetGlobalInt("tower2_entity")
	local tower3_entity = GetGlobalInt("tower3_entity")
	local tower4_entity = GetGlobalInt("tower4_entity")
	local tower5_entity = GetGlobalInt("tower5_entity")
	
	local tower1_entity_blue = GetGlobalInt("tower1_entity_blue")
	local tower2_entity_blue = GetGlobalInt("tower2_entity_blue")
	local tower3_entity_blue = GetGlobalInt("tower3_entity_blue")
	local tower4_entity_blue = GetGlobalInt("tower4_entity_blue")
	local tower5_entity_blue = GetGlobalInt("tower5_entity_blue")
	
	local time = GetGlobalInt("round.TimeLeft", 0)
	local attacker = GetGlobalInt("attacker")
	local time = string.ToMinutesSeconds(GetGlobalInt("round.TimeLeft", 0))
	local respawntime = GetGlobalInt("respawntime")
	local timeleft = timer.TimeLeft( "respawntime" )
    if !client:Alive() then -- Screen after death
	    draw.RoundedBox(0, ScrW() / 2 - (math.Round(ScrW() * 0.5462) / 2), math.Round(ScrH() * 0.8703), math.Round(ScrW() * 0.5462), math.Round(ScrH() * 0.0833), Color(30, 30, 30, 200))
		draw.RoundedBox(0, ScrW() / 2 - (math.Round(ScrW() * 0.3489) / 2),  math.Round(ScrH() * 0.1111), math.Round(ScrW() * 0.3489), math.Round(ScrH() * 0.0833), Color(30, 30, 30, 200))
		draw.SimpleText(""..fact[random_facts].."", "font3", math.Round(ScrW() * 0.235), math.Round(ScrH() * 0.9166), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Useful tips:", "font1", math.Round(ScrW() * 0.235), math.Round(ScrH() * 0.875), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText( "Respawn in " ..timerleft.. " seconds", "DeathText", math.Round(ScrW() * 0.3429),  math.Round(ScrH() * 0.1211), Color(255, 255, 255, 255), 0, 0)	
		timer.Pause("facts_shuffle")
		
		return
	
	else 
			timer.UnPause("facts_shuffle")
			timer.Create("respawn.Handle", 1, 0, respawn)
			timerleft = 10 -- If the player is alive, the timer will be stuck on 10 due to this variable. Once he dies however, this is no longer called so the timer counts to 0. The player then respawns, so this is looped again.
    end
	
	local tower_icon = {
			texture = surface.GetTextureID( 'custom/tower_icon' ),
			x 	=  math.Round(ScrW() * -0.008),
			y 	= math.Round(ScrH() * 0.5682),
			w 	= 178,
			h 	= 326
		}
	
if client:Team() == 2 then
	draw.RoundedBox(0, ScrW() * 0.01, ScrH() * 0.88, ScrW() * 0.104, ScrH() * 0.09, Color(30, 30, 30, 210))
	draw.DrawText( time, "Arial", ScrW() * 0.021, ScrH() * 0.89 , Color(255, 255, 255, 255))
	draw.DrawText( "Spectating", "DeLarge", ScrW() * 0.021, ScrH() * 0.84 , Color(255, 255, 255, 255))
elseif client:Team() == 0 or client:Team() == 1 then
    draw.RoundedBox(0,  math.Round(ScrW() * 0.0052),  math.Round(ScrH() * 0.8703),  math.Round(ScrW() * 0.1666),  math.Round(ScrH() * 0.1111), Color(40, 40, 40, 210)) -- lot of HUD assets, could be made more simple, but whatever
	draw.RoundedBox(0,  math.Round(ScrW() * 0.0114),  math.Round(ScrH() * 0.8777), math.Round(ScrW() * 0.1520),  math.Round(ScrH() * 0.0370), Color(30, 30, 30, 210)) -- I also started doing the hud without scaling it on other resolutions. If anyone reads this, --avoid using static numbers. Always multiply the screen width and height
	draw.RoundedBox(0, math.Round(ScrW() * 0.0114), math.Round(ScrH() * 0.9287), math.Round(ScrW() * 0.1520), math.Round(ScrH() * 0.0370), Color(30, 30, 30, 210))
	draw.RoundedBox(0, math.Round(ScrW() * 0.1822), math.Round(ScrH() * 0.8703), math.Round(ScrW() * 0.1145), math.Round(ScrH() * 0.1111), Color(40, 40, 40, 210))
	draw.RoundedBox(0, math.Round(ScrW() * 0.1875), math.Round(ScrH() * 0.9101), math.Round(ScrW() * 0.1015), math.Round(ScrH() * 0.0555), Color(30, 30, 30, 210))
	draw.RoundedBox(0, math.Round(ScrW() * 0.2473), math.Round(ScrH() * 0.8731), math.Round(ScrW() * 0.0416), math.Round(ScrH() * 0.0342), Color(30, 30, 30, 210))
	draw.RoundedBox(0, math.Round(ScrW() * 0.0052) ,math.Round(ScrH() * 0.8703), math.Round(ScrW() * 0.0026), math.Round(ScrH() * 0.1111), Color(255, 255, 255, 255))
	draw.RoundedBox(0, math.Round(ScrW() * 0.2968), math.Round(ScrH() * 0.8703), math.Round(ScrW() * 0.0026), math.Round(ScrH() * 0.1111), Color(255, 255, 255, 255))
	draw.RoundedBox(0, math.Round(ScrW() * 0.1796), math.Round(ScrH() * 0.8703), math.Round(ScrW() * 0.0026), math.Round(ScrH() * 0.1111), Color(255, 255, 255, 255))
	draw.RoundedBox(0, math.Round(ScrW() * 0.1692), math.Round(ScrH() * 0.8703), math.Round(ScrW() * 0.0026), math.Round(ScrH() * 0.1111), Color(255, 255, 255, 255))
	draw.RoundedBox(0, math.Round(ScrW() * 0.0140), math.Round(ScrH() * 0.8842), math.Round(ScrW() * 0.00156),math.Round(ScrH() * 0.0231), Color(255, 255, 255, 255))
	draw.RoundedBox(0, math.Round(ScrW() * 0.1588), math.Round(ScrH() * 0.8842), math.Round(ScrW() * 0.00156),math.Round(ScrH() * 0.0231), Color(255, 255, 255, 255))
	draw.RoundedBox(0, math.Round(ScrW() * 0.0140), math.Round(ScrH() * 0.9351), math.Round(ScrW() * 0.00156),math.Round(ScrH() * 0.0231), Color(255, 255, 255, 255))
	draw.RoundedBox(0, math.Round(ScrW() * 0.1588), math.Round(ScrH() * 0.9351), math.Round(ScrW() * 0.00156), math.Round(ScrH() * 0.0231), Color(255, 255, 255, 255))
	draw.RoundedBox(0, math.Round(ScrW() * 0.0156), math.Round(ScrH() * 0.8842), math.Round(ScrW() * 0.1432),math.Round(ScrH() * 0.0231),Color(180,0,0,50))
	draw.SimpleText("Ammo","DeLarge", math.Round(ScrW() * 0.1875), math.Round(ScrH() * 0.8721), Color(255, 255, 255, 255), 0, 0)
	
	
    draw.RoundedBox(0,math.Round(ScrW() * 0.0156),math.Round(ScrH() * 0.8855),math.Round(ScrW() * ((math.Clamp(client:Health(),0,100) * 2.75 / 1920) )),math.Round(ScrH() * 0.0222),Color(180,0,0,255))
	draw.RoundedBox(0,math.Round(ScrW() * 0.0156),math.Round(ScrH() * 0.9351), math.Round(ScrW() * 0.1432),math.Round(ScrH() * 0.0231),Color(0,128,255,50))
    draw.RoundedBox(0,math.Round(ScrW() * 0.0156),math.Round(ScrH() * 0.9351),math.Round(ScrW() * ((math.Clamp(client:Armor(),0,100) * 2.75 / 1920) )),math.Round(ScrH() * 0.0231),Color(0,128,255,255))
	draw.RoundedBox(0,math.Round(ScrW() * 0.8541) ,math.Round(ScrH() * 0.8303),  math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.1511), Color(40, 40, 40, 210))
	draw.RoundedBox(0,math.Round(ScrW() * 0.8541), math.Round(ScrH() * 0.8303),math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0046), Color(255, 255, 255, 255))
	draw.SimpleText("Health: "..math.Clamp(client:Health(),0,100).."%","font1", math.Round(ScrW() * 0.0260),  math.Round(ScrH() * 0.8842), Color(255, 255, 255, 255), 0, 0)
	

	
	
	draw.SimpleText("Armor: "..math.Clamp(client:Armor(),0,100).."%","font1", math.Round(ScrW() * 0.0260), math.Round(ScrH() * 0.9351), Color(255, 255, 255, 255), 0, 0)
	draw.RoundedBox(0, math.Round(ScrW() * 0.8541), math.Round(ScrH() * 0.9768),  math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0046), Color(255, 255, 255, 255))
	draw.RoundedBox(0,   math.Round(ScrW() * 0.8614),math.Round(ScrH() * 0.8454), math.Round(ScrW() * 0.1023), math.Round(ScrH() * 0.0509), Color(30, 30, 30, 210))
		draw.RoundedBox(0,   math.Round(ScrW() * 0.8614),math.Round(ScrH() * 0.9000), math.Round(ScrW() * 0.1023), math.Round(ScrH() * 0.0309), Color(30, 30, 30, 210))
	draw.RoundedBox(0,   math.Round(ScrW() * 0.8614), math.Round(ScrH() * 0.9370), math.Round(ScrW() * 0.0416), math.Round(ScrH() * 0.0324), Color(30, 30, 30, 210))
	draw.RoundedBox(0,   math.Round(ScrW() * 0.9120), math.Round(ScrH() * 0.9370), math.Round(ScrW() * 0.0516), math.Round(ScrH() * 0.0324), Color(30, 30, 30, 210))
	draw.DrawText( time, "Arial", math.Round(ScrW() * 0.8745),  math.Round(ScrH() * 0.8395) , Color(255, 255, 255, 255))
	draw.SimpleText("Tower HP:","font1", math.Round(ScrW() * 0.8645),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
	if client:Team() == 0 then
	
		if tower1_entity > 0 && tower1_entity < 3001 then
			draw.SimpleText(""..tower1_entity.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
			
		elseif tower2_entity > 0 && tower2_entity < 3001 then
			draw.SimpleText(""..tower2_entity.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		elseif tower3_entity > 0 && tower3_entity < 3001 then
			draw.SimpleText(""..tower3_entity.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		elseif tower4_entity > 0 && tower4_entity < 3001 then
			draw.SimpleText(""..tower4_entity.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		elseif tower5_entity > 0 && tower5_entity < 3001 then
			draw.SimpleText(""..tower5_entity.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		else 
			draw.SimpleText("Not built","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		end
	elseif client:Team() == 1 then
	
	if tower1_entity_blue > 0 && tower1_entity_blue < 3001 then
			draw.SimpleText(""..tower1_entity_blue.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
			
		elseif tower2_entity_blue > 0 && tower2_entity_blue < 3001 then
			draw.SimpleText(""..tower2_entity_blue.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		elseif tower3_entity_blue > 0 && tower3_entity_blue < 3001 then
			draw.SimpleText(""..tower3_entity_blue.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		elseif tower4_entity_blue > 0 && tower4_entity_blue < 3001 then
			draw.SimpleText(""..tower4_entity_blue.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		elseif tower5_entity_blue > 0 && tower5_entity_blue < 3001 then
			draw.SimpleText(""..tower5_entity_blue.."","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		else 
			draw.SimpleText("Not built","font1", math.Round(ScrW() * 0.9165),  math.Round(ScrH() * 0.9022), Color(255, 255, 255, 255), 0, 0)
		end

	end

if(client:GetActiveWeapon():IsValid()) then
if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then	

end
end






if(client:GetActiveWeapon():IsValid()) then -- draw Ammo and secondary clip
if (client:GetActiveWeapon():Clip1() != -1) then
        draw.SimpleText("" .. client:GetActiveWeapon():Clip1() .. "/" .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "Ammo",  math.Round(ScrW() * 0.1894),math.Round(ScrH() * 0.9074), Color(255, 255, 255, 255), 0, 0)
    else
        draw.SimpleText("" .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "Ammo", math.Round(ScrW() * 0.1901), math.Round(ScrH() * 0.9074), Color(255, 255, 255, 255), 0, 0)
end
 
    if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
        draw.SimpleText("" .. client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()), "Alt",  math.Round(ScrW() * 0.25), math.Round(ScrH() * 0.8703), Color(255, 255, 255, 255), 0, 0)
    end
	
	 if Player == 0 then
	 return
	 draw.RoundedBox(0, math.Round(ScrW() * 0.9427), math.Round(ScrH() * 0.9305),  math.Round(ScrW() * 0.0520),math.Round(ScrH() * 0.0046), Color(255, 255, 255, 255))
	 end






end

endtime = GetGlobalFloat("round.TimeLeft", 0) - CurTime()


end
end

resource.AddFile( "materials/custom/bullets.vmt" )
resource.AddFile( "materials/custom/shield.vmt" )
resource.AddFile( "materials/custom/cross.vmt" )
resource.AddFile( "materials/custom/heartbeat.vmt" )
hook.Add("HUDPaint", "hud", HUD)



function HideHud(name) -- Hide default HUD
    for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
        if name == v then
            return false
        end
       
    end
end
hook.Add("HUDShouldDraw", "HideDefaultHud", HideHud)

function GM:HUDPaint()
    local ply = LocalPlayer()
	local time = string.ToMinutesSeconds(1200) 
	 if !ply:Alive() then
	 else

 
	if ply:Team() == 0 then
		surface.SetFont( "font2" )
		surface.SetTextColor( 180, 0, 0, 255 );
		surface.SetTextPos(   math.Round(ScrW() * 0.8645),math.Round(ScrH() * 0.9370) );
		surface.DrawText( "Alpha" )
	end
	if ply:Team() == 1 then
	    surface.SetFont( "font2" )
		surface.SetTextColor( 0, 128, 255, 255  );
		surface.SetTextPos( math.Round(ScrW() * 0.8645), math.Round(ScrH() * 0.9370) );
		surface.DrawText( "Bravo" ) -- draw team index
		
	end
		if ply:Team() == 1 or ply:Team() == 0 then
			if ply:IsUserGroup( "user" ) then
			 surface.SetFont( "font2" )
				surface.SetTextColor( 255, 255, 255, 255  );
				surface.SetTextPos( math.Round(ScrW() * 0.9140), math.Round(ScrH() * 0.9370) );
				surface.DrawText( "No class" ) -- draw class
			end
			if ply:IsUserGroup( "assault" ) then
			 surface.SetFont( "font2" )
				surface.SetTextColor( 255, 255, 255, 255  );
				surface.SetTextPos( math.Round(ScrW() * 0.9140), math.Round(ScrH() * 0.9370) );
				surface.DrawText( "Assault" ) 
			end
			if ply:IsUserGroup( "heavy" ) then
			 surface.SetFont( "font2" )
				surface.SetTextColor( 255, 255, 255, 255  );
				surface.SetTextPos( math.Round(ScrW() * 0.9140), math.Round(ScrH() * 0.9370) );
				surface.DrawText( "Heavy" ) 
			end
			if ply:IsUserGroup( "scavenger" ) then
			 surface.SetFont( "font1" )
				surface.SetTextColor( 255, 255, 255, 255  );
				surface.SetTextPos( math.Round(ScrW() * 0.9140), math.Round(ScrH() * 0.9370) );
				surface.DrawText( "Scavenger" ) 
			end
		end
	end	
hook.Run( "HUDDrawTargetID" )
hook.Run( "HUDDrawPickupHistory" )
hook.Run( "DrawDeathNotice", 0.85, 0.04 )
end

