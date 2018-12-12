include("shared.lua")
include("cl_hud.lua")
AddCSLuaFile("rounds.lua")
AddCSLuaFile("init.lua")
include("cl_scoreboard.lua")
include("cl_deathnotice.lua")


 function TeamMenu( ply ) -- Team menu select, inspired by Persious team select
   local PlayerList = nil
   local RedPlayers = GetGlobalInt( "RedTeamNum" )
   local BluePlayers = GetGlobalInt( "BlueTeamNum" )
   local Spectators = GetGlobalInt( "SpecTeamNum" )
 local TeamMenu = vgui.Create( "DFrame" )
 TeamMenu:SetPos(math.Round(ScrW() * 1.1302), math.Round(ScrH() * 0.3611) )
 TeamMenu:SetSize( math.Round(ScrW() * 0.3125), math.Round(ScrH() * 0.2777) )
 TeamMenu:SetTitle( "Select a team" )
 local blur = Material("pp/blurscreen")
	local function DrawBlur(panel, amount)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
	end
 TeamMenu:ShowCloseButton( false )
 TeamMenu:SetVisible( true )
 TeamMenu:SetDraggable ( false )
 TeamMenu:MakePopup( )
 TeamMenu:SetBackgroundBlur( true )
 function TeamMenu:Paint( slf )
				 DrawBlur(self, 3)
         draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 10,10,10,200) )
		 draw.DrawText( ""..RedPlayers.."", "DeLarge", math.Round(ScrW() * 0.0729), math.Round(ScrH() * 0.0925), Color(255, 255, 255, 255), 0, 0)
		 draw.DrawText( ""..BluePlayers.."", "DeLarge",  math.Round(ScrW() * 0.2291),  math.Round(ScrH() * 0.0925), Color(255, 255, 255, 255), 0, 0)
		 draw.DrawText( ""..Spectators.."", "DeLarge", math.Round(ScrW() * 0.1510), math.Round(ScrH() * 0.1851), Color(255, 255, 255, 255), 0, 0)
		 draw.RoundedBox(0, 0, 0,math.Round(ScrW() * 0.3125), math.Round(ScrH() * 0.00277), Color(255, 255, 255, 255))
		 draw.RoundedBox(0, 0, math.Round(ScrH() * 0.275), math.Round(ScrW() * 0.3125), math.Round(ScrH() * 0.00277), Color(255, 255, 255, 255))
		 draw.RoundedBox(0, math.Round(ScrW() * 0.0088), math.Round(ScrH() * 0.0277), math.Round(ScrW() * 0.0015), math.Round(ScrH() * 0.0462), Color(255, 255, 255, 255))
		 draw.RoundedBox(0, math.Round(ScrW() * 0.1406), math.Round(ScrH() * 0.0277), math.Round(ScrW() * 0.0015), math.Round(ScrH() * 0.0462), Color(255, 255, 255, 255))
		 draw.RoundedBox(0, math.Round(ScrW() * 0.1651), math.Round(ScrH() * 0.0277), math.Round(ScrW() * 0.0015), math.Round(ScrH() * 0.0462), Color(255, 255, 255, 255))
		 draw.RoundedBox(0, math.Round(ScrW() * 0.2968) , math.Round(ScrH() * 0.0277), math.Round(ScrW() * 0.0015), math.Round(ScrH() * 0.0462), Color(255, 255, 255, 255))
end

if !TeamMenu.Open then
	TeamMenu:MoveTo( math.Round(ScrW() * 0.3437),   math.Round(ScrH() * 0.3148), 0)
end

local team_1 = vgui.Create( "DButton", TeamMenu )
team_1:SetPos( math.Round(TeamMenu:GetWide() * 0.0333) , TeamMenu:GetTall() * (0.1 ) )
team_1:SetSize( math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0462) )
team_1:SetText( "Team Alpha" )

team_1.Paint = function()
    surface.SetDrawColor( 180,0,0,255 )
	surface.DrawRect( 0, 0, team_1:GetWide(), team_1:GetTall() )
end

team_1.DoClick = function() -- team balance (you can't enter your own team and can't change teams if the other team has more players)

		if ply:Team() == TEAM_1 then
			ply:ChatPrint( "You are already in the Red Team." )
		else
			if RedPlayers > BluePlayers then
				ply:ChatPrint( "You can't change teams now. There are too many players in the Red team." )
			else 
				if ply:Alive() then
					net.Start("ChangeTeamRed")
					net.SendToServer()
					TeamMenu:Close()
				else
					ply:ChatPrint( "You cannot change team while you're dead." )
				end
			end
		end
end

local team_2 = vgui.Create( "DButton", TeamMenu )
team_2:SetPos(math.Round(TeamMenu:GetWide() * 0.5333), TeamMenu:GetTall() * (0.1 ) )
team_2:SetSize(  math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0462) )
team_2:SetText( "Team Bravo" )
 
team_2.Paint = function()
	surface.SetDrawColor( 0, 128, 255, 255 )
	surface.DrawRect( 0, 0, team_2:GetWide(), team_2:GetTall() )
end
 
team_2.DoClick = function() -- Same as red button
		if ply:Team() == TEAM_2 then
		ply:ChatPrint( "You are already in the Blue Team." )
		else
			if BluePlayers > RedPlayers then
				ply:ChatPrint( "You can't change teams now. There are too many players in the Blue team." )
			else
			if ply:Alive() then
				net.Start("ChangeTeamBlue")
				net.SendToServer()
				TeamMenu:Close()
			else
				ply:ChatPrint( "You cannot change team while you're dead." )
			end
end
end
end

local team_spec = vgui.Create( "DButton", TeamMenu )
team_spec:SetPos( math.Round(TeamMenu:GetWide() * 0.2916), math.Round(TeamMenu:GetTall() * (0.4666 ) ) )
team_spec:SetSize(  math.Round(ScrW() * 0.1302),  math.Round(ScrH() * 0.0462) )
team_spec:SetText( "Spectate" )

team_spec.Paint = function()
	surface.SetDrawColor( 128, 128, 128, 255 )
	surface.DrawRect( 0, 0, team_spec:GetWide(), team_spec:GetTall() )
end

team_spec.DoClick = function() -- Same as red button
		if ply:Team() == TEAM_SPEC then
		ply:ChatPrint( "You are already spectating." )
		else
		if ply:Alive() then
             net.Start("ChangeTeamSpec")
				net.SendToServer()
			TeamMenu:Close()
		else
			ply:ChatPrint( "You cannot change team while you're dead." )
		end
end
end


local close_button = vgui.Create( "DButton", TeamMenu )
close_button:SetPos(  math.Round(TeamMenu:GetWide() * 0.2833), TeamMenu:GetTall() * (0.85 ) )
close_button:SetSize(  math.Round(ScrW() * 0.1302),math.Round(ScrH() * 0.0185) )
close_button:SetText( "Close" )

close_button.Paint = function()
    draw.RoundedBox( 8, 0, 0, close_button:GetWide(), close_button:GetTall(), Color( 0,0,0,225 ) )
    surface.DrawRect( 0, 0, close_button:GetWide(), close_button:GetTall() )
end

close_button.DoClick = function()
    TeamMenu:Close()
end

 end
concommand.Add( "TeamMenu", TeamMenu)

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

	
net.Receive("pat",function(len) 
local pat = vgui.Create( "DFrame" )
pat:SetPos(math.Round(ScrW() * 0.7083), ScrH() / 2 -250 )
pat:SetSize( math.Round(ScrW() * 0.4166), math.Round(ScrH() * 0.2777) )
pat:SetTitle( "" )
pat:ShowCloseButton( false )
pat:SetDraggable ( false )
pat:SetVisible( true )
pat:MakePopup( )
 local blur = Material("pp/blurscreen")
	local function DrawBlur(panel, amount)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
	end
function pat:Paint()
 DrawBlur(self, 3)
draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 10,10,10,200) )
draw.SimpleText("DRAW!","patfont", math.Round(ScrW() * 0.1429), math.Round(ScrH() * 0.0462), Color(255, 255, 255, 255), 0, 0)
draw.SimpleText("No one wins!","patfont", math.Round(ScrW() * 0.0945), math.Round(ScrH() * 0.1388), Color(255, 255, 255, 255), 0, 0)
draw.RoundedBox(0, 0, 0,  math.Round(ScrW() * 0.4166),  math.Round(ScrH() * 0.0046), Color(255, 255, 255, 255))
draw.RoundedBox(0, 0,  math.Round(ScrH() * 0.2731),  math.Round(ScrW() * 0.4166),  math.Round(ScrH() * 0.0046), Color(255, 255, 255, 255))
end
if !pat.Open then
	pat:MoveTo(math.Round(ScrW() * 0.2916),  math.Round(ScrH() * 0.3148), 0)
	pat:SetKeyboardInputEnabled(false)
	end
local pat_button = vgui.Create( "DButton", pat )
pat_button:SetPos(  math.Round(pat:GetWide() * 0.3437), math.Round(pat:GetTall() * 0.8333) )
pat_button:SetSize(  math.Round(ScrW() * 0.1302),  math.Round(ScrH() * 0.0185) )
pat_button:SetText( "Close" )

pat_button.Paint = function()
    draw.RoundedBox( 8, 0, 0, pat_button:GetWide(), pat_button:GetTall(), Color( 0,0,0,225 ) )
    surface.DrawRect( 0, 0, pat_button:GetWide(), pat_button:GetTall() )
end

pat_button.DoClick = function()
    pat:Close()	
end	

end)

net.Receive("red_win_panel",function(len) 
local time_elapsed = string.ToMinutesSeconds(GetGlobalInt("round.TimeLeft"))
local pat = vgui.Create( "DFrame" )
pat:SetPos(math.Round(ScrW() * 0.7083), ScrH() / 2 -250 )
pat:SetSize( math.Round(ScrW() * 0.4166), math.Round(ScrH() * 0.2777) )
pat:SetTitle( "" )
pat:ShowCloseButton( false )
pat:SetDraggable ( false )
pat:SetVisible( true )
pat:MakePopup( )
 local blur = Material("pp/blurscreen")
	local function DrawBlur(panel, amount)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
	end
	
if GetGlobalInt("round.TimeLeft") > 60 then

	jednotka = "minutes"

	elseif GetGlobalInt("round.TimeLeft") <= 60 then
		jednotka = "seconds"
end
max_kills = -1000
player_most = "no one"
for k, v in pairs( player.GetAll() ) do

	if v:Frags() >= max_kills && v:Team() == 0 then
		max_kills = v:Frags()
		player_most = v:GetName()
	end
end
function pat:Paint()
 DrawBlur(self, 3)
 
local zlaty_bludistak = {
			texture = surface.GetTextureID( 'custom/zlaty_bludistak' ),
			x 	= math.Round(ScrW() * 0.0229),
			y 	=  math.Round(ScrH() * 0.1462),
			w 	= math.Round(ScrW() * 0.0333),
			h 	= math.Round(ScrH() * 0.0592)
		}

draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 10,10,10,200) )
draw.SimpleText("TEAM ALPHA WINS!","winfont", math.Round(ScrW() * 0.0229), math.Round(ScrH() * 0.0462), Color(255, 255, 255, 255), 0, 0)
draw.SimpleText("Red team was able to build the final tower with "..time_elapsed.." "..jednotka.. " left","winfont2", math.Round(ScrW() * 0.0229), math.Round(ScrH() * 0.1062), Color(255, 255, 255, 255), 0, 0)


	draw.TexturedQuad(zlaty_bludistak)
	draw.SimpleText(""..player_most.." with "..max_kills.." kills","winfont2", math.Round(ScrW() * 0.0629), math.Round(ScrH() * 0.1602), Color(255, 255, 255, 255), 0, 0)
	

draw.RoundedBox(0, 0, 0,  math.Round(ScrW() * 0.4166),  math.Round(ScrH() * 0.0046), Color(150, 20, 20, 255))
draw.RoundedBox(0, 0,  math.Round(ScrH() * 0.2731),  math.Round(ScrW() * 0.4166),  math.Round(ScrH() * 0.0046), Color(150, 20, 20, 255))
end
if !pat.Open then
	pat:MoveTo(math.Round(ScrW() * 0.2916),  math.Round(ScrH() * 0.3148), 0)
	pat:SetKeyboardInputEnabled(false)
	end

end)

net.Receive("blue_win_panel",function(len) 
local time_elapsed = string.ToMinutesSeconds(GetGlobalInt("round.TimeLeft"))
local pat = vgui.Create( "DFrame" )
pat:SetPos(math.Round(ScrW() * 0.7083), ScrH() / 2 -250 )
pat:SetSize( math.Round(ScrW() * 0.4166), math.Round(ScrH() * 0.2777) )
pat:SetTitle( "" )
pat:ShowCloseButton( false )
pat:SetDraggable ( false )
pat:SetVisible( true )
pat:MakePopup( )
 local blur = Material("pp/blurscreen")
	local function DrawBlur(panel, amount)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
	end
	
if GetGlobalInt("round.TimeLeft") > 60 then

	jednotka = "minutes"

	elseif GetGlobalInt("round.TimeLeft") <= 60 then
		jednotka = "seconds"
end

max_kills = -1000
player_most = "no one"
for k, v in pairs( player.GetAll() ) do

	if v:Frags() >= max_kills && v:Team() == 1 then
		max_kills = v:Frags()
		player_most = v:GetName()
	end
end
function pat:Paint()
 DrawBlur(self, 3)
 
local zlaty_bludistak = {
			texture = surface.GetTextureID( 'custom/zlaty_bludistak' ),
			x 	= math.Round(ScrW() * 0.0229),
			y 	=  math.Round(ScrH() * 0.1462),
			w 	= math.Round(ScrW() * 0.0333),
			h 	= math.Round(ScrH() * 0.0592)
		}

draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 10,10,10,200) )
draw.SimpleText("TEAM BRAVO WINS!","winfont", math.Round(ScrW() * 0.0229), math.Round(ScrH() * 0.0462), Color(255, 255, 255, 255), 0, 0)
draw.SimpleText("Blue team was able to build the final tower with "..time_elapsed.." "..jednotka.. " left","winfont2", math.Round(ScrW() * 0.0229), math.Round(ScrH() * 0.1062), Color(255, 255, 255, 255), 0, 0)


	draw.TexturedQuad(zlaty_bludistak)
	draw.SimpleText(""..player_most.." with "..max_kills.." kills","winfont2", math.Round(ScrW() * 0.0629), math.Round(ScrH() * 0.1602), Color(255, 255, 255, 255), 0, 0)
	

draw.RoundedBox(0, 0, 0,  math.Round(ScrW() * 0.4166),  math.Round(ScrH() * 0.0046), Color(25, 25, 170, 255))
draw.RoundedBox(0, 0,  math.Round(ScrH() * 0.2731),  math.Round(ScrW() * 0.4166),  math.Round(ScrH() * 0.0046), Color(25, 25, 170, 255))
end
if !pat.Open then
	pat:MoveTo(math.Round(ScrW() * 0.2916),  math.Round(ScrH() * 0.3148), 0)
	pat:SetKeyboardInputEnabled(false)
	end

end)

net.Receive("alert_one",function( ply, len ) 
-- Notification panel
NotifyPanel = vgui.Create( "DNotify" )
NotifyPanel:SetPos( math.Round(ScrW() * 0.8541), math.Round(ScrH() * 0.6685) )
NotifyPanel:SetSize( math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0740) )

-- Gray background panel
local bg = vgui.Create( "DPanel", NotifyPanel )
bg:Dock( FILL )
bg:SetBackgroundColor( Color( 40, 40, 40, 210 ) )


local lbl = vgui.Create( "DLabel", bg )
lbl:SetPos( math.Round(ScrW() * 0.0026), 0 )
lbl:SetSize( math.Round(ScrW() * 0.1041), math.Round(ScrH() * 0.0740) )
lbl:SetText( "The RED team built a final tower floor!" )
lbl:SetTextColor( Color( 255, 255, 255 ) )
lbl:SetFont( "alert_one" )
lbl:SetWrap( true )

-- Add the background panel to the notification
NotifyPanel:AddItem( bg )
end)

net.Receive("destroy_alert",function( ply, len ) 

NotifyPanel = vgui.Create( "DNotify" )
NotifyPanel:SetPos( math.Round(ScrW() * 0.8541), math.Round(ScrH() * 0.6685) )
NotifyPanel:SetSize(  math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0740) )

local bg = vgui.Create( "DPanel", NotifyPanel )
bg:Dock( FILL )
bg:SetBackgroundColor( Color( 40, 40, 40, 210 ) )


local lbl = vgui.Create( "DLabel", bg )
lbl:SetPos(math.Round(ScrW() * 0.0026), 0 )
lbl:SetSize(  math.Round(ScrW() * 0.1041), math.Round(ScrH() * 0.0740) )
lbl:SetText( "The RED team lost a floor from the final tower!" )
lbl:SetTextColor( Color( 180, 0, 0 ) )
lbl:SetFont( "alert_one" )
lbl:SetWrap( true )


NotifyPanel:AddItem( bg )
end)

net.Receive("alert_one_blue",function( ply, len ) 
-- Notification panel
NotifyPanel = vgui.Create( "DNotify" )
NotifyPanel:SetPos( math.Round(ScrW() * 0.8541), math.Round(ScrH() * 0.6685) )
NotifyPanel:SetSize( math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0740) )

-- Gray background panel
local bg = vgui.Create( "DPanel", NotifyPanel )
bg:Dock( FILL )
bg:SetBackgroundColor( Color( 40, 40, 40, 210 ) )


local lbl = vgui.Create( "DLabel", bg )
lbl:SetPos( math.Round(ScrW() * 0.0026), 0 )
lbl:SetSize( math.Round(ScrW() * 0.1041), math.Round(ScrH() * 0.0740) )
lbl:SetText( "The BLUE team built a final tower floor!" )
lbl:SetTextColor( Color( 255, 255, 255 ) )
lbl:SetFont( "alert_one" )
lbl:SetWrap( true )

-- Add the background panel to the notification
NotifyPanel:AddItem( bg )
end)

net.Receive("destroy_alert_blue",function( ply, len ) 

NotifyPanel = vgui.Create( "DNotify" )
NotifyPanel:SetPos( math.Round(ScrW() * 0.8541), math.Round(ScrH() * 0.6685) )
NotifyPanel:SetSize(  math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0740) )

local bg = vgui.Create( "DPanel", NotifyPanel )
bg:Dock( FILL )
bg:SetBackgroundColor( Color( 40, 40, 40, 210 ) )


local lbl = vgui.Create( "DLabel", bg )
lbl:SetPos(math.Round(ScrW() * 0.0026), 0 )
lbl:SetSize(  math.Round(ScrW() * 0.1041), math.Round(ScrH() * 0.0740) )
lbl:SetText( "The BLUE team lost a floor from the final tower!" )
lbl:SetTextColor( Color( 180, 0, 0 ) )
lbl:SetFont( "alert_one" )
lbl:SetWrap( true )


NotifyPanel:AddItem( bg )
end)



net.Receive("class_selection", function (ply,len)
	local Class_select = vgui.Create( "DFrame" )
	Class_select:SetPos( math.Round(ScrW() * 0.25) , math.Round(ScrH() * 0.25) )
	Class_select:SetSize( math.Round(ScrW() * 0.5), math.Round(ScrH() * 0.5) )
	Class_select:SetTitle( "" )
	Class_select:ShowCloseButton( false )
	Class_select:SetDraggable ( false )
	Class_select:SetVisible( true )
	Class_select:MakePopup( )
	 local blur = Material("pp/blurscreen") --https://gmod.facepunch.com/f/gmoddev/mlnc/How-would-I-add-blur-to-a-DFrame/1/
	local function DrawBlur(panel, amount)
	local x, y = panel:LocalToScreen(0, 0)
	local scrW, scrH = ScrW(), ScrH()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(blur)
	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
	end
	end
	function Class_select:Paint()
		 DrawBlur(self, 3)
		draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 10,10,10,200) )
		draw.SimpleText("SELECT YOUR CLASS","classfont", math.Round(Class_select:GetWide() * 0.2281), math.Round(Class_select:GetTall() * 0.0370), Color(255, 255, 255, 255), 0, 0)
		draw.RoundedBox( 0, 0, self:GetTall() - math.Round(Class_select:GetTall() * 0.0037), self:GetWide(), math.Round(Class_select:GetTall() * 0.0037), Color( 256,256,256,256) )
		draw.RoundedBox( 0, 0, 0, self:GetWide(), math.Round(Class_select:GetTall() * 0.0037), Color( 256,256,256,256) )
		draw.RoundedBox( 0, 0, math.Round(Class_select:GetTall() * 0.1851), self:GetWide(), math.Round(Class_select:GetTall() * 0.0037), Color( 256,256,256,256) )
		local TexturedQuadStructure = {
			texture = surface.GetTextureID( 'custom/smg' ),
			color	= Color( 255, 255, 255, 255 ),
			x 	= math.Round(Class_select:GetWide() * 0.1458),
			y 	= math.Round(Class_select:GetTall() * 0.2222),
			w 	= math.Round(ScrW() * 0.1041),
			h 	=  math.Round(ScrH() * 0.0925)
		}
		draw.TexturedQuad( TexturedQuadStructure )
		draw.SimpleText("ASSAULT","classfont1",  math.Round(Class_select:GetWide() * 0.1666), math.Round(Class_select:GetTall() * 0.4074), Color(255, 255, 255, 255), 0, 0)
		draw.RoundedBox( 0, math.Round(ScrW() * 0.0833), math.Round(ScrH() * 0.25), math.Round(Class_select:GetWide() * 0.1770), math.Round(Class_select:GetTall() * 0.0037), Color( 256,256,256,256) )
		draw.SimpleText("Normal speed","classfont2",  math.Round(Class_select:GetWide() * 0.1666), math.Round(Class_select:GetTall() * 0.5092), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Shotgun","classfont2", math.Round(Class_select:GetWide() * 0.1666), math.Round(Class_select:GetTall() * 0.5462), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Pistol","classfont2", math.Round(Class_select:GetWide() * 0.1666), math.Round(Class_select:GetTall() * 0.5833), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("SMG (2 grenades)","classfont2", math.Round(Class_select:GetWide() * 0.1666), math.Round(Class_select:GetTall() * 0.6203), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Normal mining speed","classfont2", math.Round(Class_select:GetWide() * 0.1666), math.Round(Class_select:GetTall() * 0.6574), Color(255, 255, 255, 255), 0, 0)
		
		local TexturedQuadStructure1 = {
			texture = surface.GetTextureID( 'custom/rpg' ),
			color	= Color( 255, 255, 255, 255 ),
			x 	= math.Round(Class_select:GetWide() * 0.375),
			y 	= math.Round(Class_select:GetTall() * 0.2222),
			w 	= math.Round(ScrW() * 0.1041),
			h 	= math.Round(ScrH() * 0.0925)
		}
		draw.TexturedQuad( TexturedQuadStructure1 )
		draw.SimpleText("HEAVY","classfont1", math.Round(Class_select:GetWide() * 0.4062), math.Round(Class_select:GetTall() * 0.4074), Color(255, 255, 255, 255), 0, 0)
		draw.RoundedBox( 0, math.Round(ScrW() * 0.2031), math.Round(ScrH() * 0.25), math.Round(Class_select:GetWide() * 0.125),  math.Round(Class_select:GetTall() * 0.0037), Color( 256,256,256,256) )
		draw.SimpleText("Slow speed(0.5)","classfont2", math.Round(Class_select:GetWide() * 0.3958), math.Round(Class_select:GetTall() * 0.5092), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("RPG (3 rockets)","classfont2", math.Round(Class_select:GetWide() * 0.3958), math.Round(Class_select:GetTall() * 0.5462), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("4 grenades","classfont2", math.Round(Class_select:GetWide() * 0.3958), math.Round(Class_select:GetTall() * 0.5833), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Pulse rifle","classfont2", math.Round(Class_select:GetWide() * 0.3958), math.Round(Class_select:GetTall() * 0.6203), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Slow mining speed(0.5)","classfont2", math.Round(Class_select:GetWide() * 0.3958), math.Round(Class_select:GetTall() * 0.6574), Color(255, 255, 255, 255), 0, 0)
		local TexturedQuadStructure2 = {
			texture = surface.GetTextureID( 'custom/crossbow' ),
			color	= Color( 255, 255, 255, 255 ),
			x 	= math.Round(Class_select:GetWide() * 0.6145),
			y 	= math.Round(Class_select:GetTall() * 0.2222),
			w 	= math.Round(ScrW() * 0.1041),
			h 	= math.Round(ScrH() * 0.0925)
		}
		draw.TexturedQuad( TexturedQuadStructure2 )
		draw.SimpleText("SCAVENGER","classfont1", math.Round(Class_select:GetWide() * 0.6145), math.Round(Class_select:GetTall() * 0.4074), Color(255, 255, 255, 255), 0, 0)
		draw.RoundedBox( 0, math.Round(ScrW() * 0.3098), math.Round(ScrH() * 0.25), math.Round(Class_select:GetWide() * 0.2260), math.Round(Class_select:GetTall() * 0.0037), Color( 256,256,256,256) )
		draw.SimpleText("Fast speed(1.25)","classfont2", math.Round(Class_select:GetWide() * 0.6354), math.Round(Class_select:GetTall() * 0.5092), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Pistol","classfont2",  math.Round(Class_select:GetWide() * 0.6354), math.Round(Class_select:GetTall() * 0.5462), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText(".357 Magnum","classfont2",  math.Round(Class_select:GetWide() * 0.6354), math.Round(Class_select:GetTall() * 0.5833), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Crossbow","classfont2",  math.Round(Class_select:GetWide() * 0.6354), math.Round(Class_select:GetTall() * 0.6203), Color(255, 255, 255, 255), 0, 0)
		draw.SimpleText("Fast mining speed(1.25)","classfont2",  math.Round(Class_select:GetWide() * 0.6354), math.Round(Class_select:GetTall() * 0.6574), Color(255, 255, 255, 255), 0, 0)
		
	end
	if !Class_select.Open then
		Class_select:MoveTo(math.Round(ScrW() * 0.25),  math.Round(ScrH() * 0.25) , 0)
	else
		Class_select:SetKeyboardInputEnabled(false)
	end
	local assault_button = vgui.Create( "DButton", Class_select )
	assault_button:SetPos(  math.Round(Class_select:GetWide() * 0.1666),math.Round(Class_select:GetTall() * 0.7222) )
	assault_button:SetSize( math.Round(ScrW() * 0.1041), math.Round(ScrH() * 0.0277) )
	assault_button:SetText( "Choose Class" )

	assault_button.Paint = function()
		draw.RoundedBox( 8, 0, 0, assault_button:GetWide(), assault_button:GetTall(), Color( 128,0,0,200 ) )
		surface.DrawRect( 0, 0, assault_button:GetWide(), assault_button:GetTall() )
	end
	
	local heavy_button = vgui.Create( "DButton", Class_select )
	heavy_button:SetPos(  math.Round(Class_select:GetWide() * 0.3958),math.Round(Class_select:GetTall() * 0.7222) )
	heavy_button:SetSize( math.Round(ScrW() * 0.1041), math.Round(ScrH() * 0.0277) )
	heavy_button:SetText( "Choose Class" )

	heavy_button.Paint = function()
		draw.RoundedBox( 8, 0, 0, heavy_button:GetWide(), heavy_button:GetTall(), Color( 128,0,0,200 ) )
		surface.DrawRect( 0, 0, heavy_button:GetWide(), heavy_button:GetTall() )
	end
	local scavenger_button = vgui.Create( "DButton", Class_select )
	scavenger_button:SetPos(   math.Round(Class_select:GetWide() * 0.6354),math.Round(Class_select:GetTall() * 0.7222) )
	scavenger_button:SetSize( math.Round(ScrW() * 0.1041), math.Round(ScrH() * 0.0277) )
	scavenger_button:SetText( "Choose Class" )

	scavenger_button.Paint = function()
		draw.RoundedBox( 8, 0, 0, scavenger_button:GetWide(), scavenger_button:GetTall(), Color( 128,0,0,200 ) )
		surface.DrawRect( 0, 0, scavenger_button:GetWide(), scavenger_button:GetTall() )
	end

	assault_button.DoClick = function()
	local ply = LocalPlayer()
	local assault_red = GetGlobalBool("assault_red")
	local assault_blue = GetGlobalBool("assault_blue")
		if ply:Team() == TEAM_1 then
			if ply:Alive() then
				if assault_red == true then
					net.Start("Class_assault")					
					net.SendToServer()
					Class_select:Close()
				else
					ply:ChatPrint( "You can't change to this class until you research it!" )
				end
			else
				ply:ChatPrint( "You cannot change class while you're dead." )
			end
		end
		if ply:Team() == TEAM_2 then
			if ply:Alive() then
					if assault_blue == true then
						net.Start("Class_assault")					
						net.SendToServer()
						Class_select:Close()
					else
						ply:ChatPrint( "You can't change to this class until you research it!" )
					end
				else
					ply:ChatPrint( "You cannot change class while you're dead." )
				end
			end
		end	
	heavy_button.DoClick = function()
	local ply = LocalPlayer()
	local heavy_red = GetGlobalBool("heavy_red")
	local heavy_blue = GetGlobalBool("heavy_blue")
		if ply:Team() == TEAM_1 then
			if ply:Alive() then
				if heavy_red == true then
					net.Start("Class_heavy")
					net.SendToServer()
					Class_select:Close()
				else
					ply:ChatPrint( "You can't change to this class until you research it!" )
				end
			else
				ply:ChatPrint( "You cannot change class while you're dead." )
			end
		end
		if ply:Team() == TEAM_2 then
			if ply:Alive() then
					if heavy_blue == true then
						net.Start("Class_heavy")					
						net.SendToServer()
						Class_select:Close()
					else
						ply:ChatPrint( "You can't change to this class until you research it!" )
					end
				else
					ply:ChatPrint( "You cannot change class while you're dead." )
				end
			end
		end	
	scavenger_button.DoClick = function()
	local ply = LocalPlayer()
	local scav_red = GetGlobalBool("scav_red")
	local scav_blue = GetGlobalBool("scav_blue")
		if ply:Team() == TEAM_1 then
			if ply:Alive() then
				if scav_red == true then
					net.Start("Class_scavenger")
					net.SendToServer()
					Class_select:Close()
				else
					ply:ChatPrint( "You can't change to this class until you research it!" )
				end
			else
				ply:ChatPrint( "You cannot change class while you're dead." )
			end
		end
		if ply:Team() == TEAM_2 then
			if ply:Alive() then
						if scav_blue == true then
							net.Start("Class_scavenger")					
							net.SendToServer()
							Class_select:Close()
						else
							ply:ChatPrint( "You can't change to this class until you research it!" )
						end
					else
						ply:ChatPrint( "You cannot change class while you're dead." )
					end
				end
		end
	local pat_button = vgui.Create( "DButton", Class_select )
	pat_button:SetPos(  math.Round(Class_select:GetWide() * 0.3697), math.Round(Class_select:GetTall() * 0.8888) )
	pat_button:SetSize( math.Round(ScrW() * 0.1302), math.Round(ScrH() * 0.0185) )
	pat_button:SetText( "Close" )

	pat_button.Paint = function()
		draw.RoundedBox( 8, 0, 0, pat_button:GetWide(), pat_button:GetTall(), Color( 0,0,0,225 ) )
		surface.DrawRect( 0, 0, pat_button:GetWide(), pat_button:GetTall() )
	end

	pat_button.DoClick = function()
		Class_select:Close()
		
	end	

end)

 

