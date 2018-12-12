include("shared.lua")
AddCSLuaFile("player_state.lua")
AddCSLuaFile("init.lua")
local Scoreboard = nil
local PlayerList = nil
local PlayerListblue = nil

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







function GM:ScoreboardShow()
local RedPlayers = GetGlobalInt( "RedTeamNum" )
   local BluePlayers = GetGlobalInt( "BlueTeamNum" )
   local Spectators = GetGlobalInt( "SpecTeamNum" )
	if !IsValid(Scoreboard) then
		Scoreboard = vgui.Create("DFrame")
		Scoreboard:SetSize(  math.Round(ScrW() * 0.4947),  math.Round(ScrH() * 0.4629) ) -- W = 950 , H = 500
		Scoreboard:SetPos( math.Round(ScrW() * 0.2526),math.Round(ScrH() * 0.2685))
		Scoreboard:SetTitle("")
		Scoreboard:SetDraggable(false)
		Scoreboard:ShowCloseButton(false)
		Scoreboard:SetVisible( true )
		
Scoreboard.Paint = function()
	draw.RoundedBox( 0, 0, 0, Scoreboard:GetWide(), Scoreboard:GetTall(), Color( 10,10,10,200) )
	draw.RoundedBox(0,0,0, Scoreboard:GetWide() , math.Round(ScrH() * 0.0027), Color(255,255,255,255))
	draw.RoundedBox(0,0,math.Round(ScrH() * 0.4601),Scoreboard:GetWide() ,  math.Round(ScrH() * 0.0027), Color(255,255,255,255))
	draw.RoundedBox(0,0,math.Round(ScrH() * 0.0462),Scoreboard:GetWide() ,  math.Round(ScrH() * 0.0027), Color(255,255,255,255))
	draw.RoundedBox(0,0,math.Round(ScrH() * 0.0740),Scoreboard:GetWide() ,  math.Round(ScrH() * 0.0027), Color(255,255,255,255))
	draw.RoundedBox(0,math.Round(ScrW() * 0.2458),0,math.Round(ScrW() * 0.00156) , math.Round(ScrH() * 0.5555), Color(255,255,255,255))
	draw.RoundedBox(0,0,0,math.Round(ScrW() * 0.00156) , math.Round(ScrH() * 0.5555), Color(255,255,255,255))
	draw.RoundedBox(0,math.Round(ScrW() * 0.4932),0,math.Round(ScrW() * 0.00156) , math.Round(ScrH() * 0.5555), Color(255,255,255,255))
	draw.SimpleText("ALPHA", "scorefont", math.Round(Scoreboard:GetWide() * 0.0105),math.Round(Scoreboard:GetTall() * 0.002),Color(200,0,0))
	draw.SimpleText("BRAVO", "scorefont", math.Round(Scoreboard:GetWide() * 0.5052),math.Round(Scoreboard:GetTall() * 0.002),Color(0,128,255))
	draw.SimpleText("Kills", "DermaDe",  math.Round(Scoreboard:GetWide() * 0.3684),math.Round(Scoreboard:GetTall() * 0.13)	,Color(255,255,255))
	draw.SimpleText("Deaths", "DermaDe", math.Round(Scoreboard:GetWide() * 0.4105),math.Round(Scoreboard:GetTall() * 0.13)	,Color(255,255,255))
	draw.SimpleText("Ping", "DermaDe", math.Round(Scoreboard:GetWide() * 0.4631),math.Round(Scoreboard:GetTall() * 0.13)	,Color(255,255,255))
	draw.SimpleText("Kills", "DermaDe", math.Round(Scoreboard:GetWide() * 0.8631),math.Round(Scoreboard:GetTall() * 0.13)	,Color(255,255,255))
	draw.SimpleText("Deaths", "DermaDe", math.Round(Scoreboard:GetWide() * 0.9052),math.Round(Scoreboard:GetTall() * 0.13)	,Color(255,255,255))
	draw.SimpleText("Ping", "DermaDe", math.Round(Scoreboard:GetWide() * 0.9578),math.Round(Scoreboard:GetTall() * 0.13)	,Color(255,255,255))
end
local PlayerScrollPanel = vgui.Create("DScrollPanel", Scoreboard)
PlayerScrollPanel:SetSize(math.Round(Scoreboard:GetWide() * 0.4968), math.Round(Scoreboard:GetTall() * 0.96))
PlayerScrollPanel:SetPos(0,math.Round(Scoreboard:GetTall() * 0.166))


PlayerList = vgui.Create("DListLayout", PlayerScrollPanel)
PlayerList:SetSize(PlayerScrollPanel:GetWide(), PlayerScrollPanel:GetTall() )
PlayerList:SetPos(math.Round(Scoreboard:GetWide() * 0.00315),0)

end



if IsValid(Scoreboard) then
PlayerList:Clear()
local PLAYERS = player.GetAll()
table.sort( PLAYERS, function( a, b ) return a:Frags() > b:Frags() end )
for k,v in pairs(PLAYERS) do
if v:Team() == 0 && v:IsPlayer() then -- RED SIDE
local PlayerPanel = vgui.Create("DPanel", PlayerList)
PlayerPanel:SetSize(PlayerList:GetWide(), math.Round(ScrH() * 0.02777))
PlayerPanel:SetPos(0,0)
PlayerPanel.Paint = function()



local TexturedQuadStructure = {
			texture = surface.GetTextureID( 'custom/smg' ),
			color	= Color( 255, 0, 255, 255 ),
			x 	= math.Round(PlayerPanel:GetWide() * 0.6144),
			y 	= 1,
			w 	= math.Round(ScrW() * 0.0208),
			h 	= math.Round(ScrH() * 0.0277)
		}
		
		local heavy_icon = {
			texture = surface.GetTextureID( 'custom/rpg' ),
			color	= Color( 255, 0, 255, 255 ),
			x 	= math.Round(PlayerPanel:GetWide() * 0.6144),
			y 	= 1,
			w 	= math.Round(ScrW() * 0.0208),
			h 	= math.Round(ScrH() * 0.0277)
		}
		local scav_icon = {
			texture = surface.GetTextureID( 'custom/crossbow' ),
			color	= Color( 255, 0, 255, 255 ),
			x 	= math.Round(PlayerPanel:GetWide() * 0.6144),
			y 	= 1,
			w 	= math.Round(ScrW() * 0.0208),
			h 	= math.Round(ScrH() * 0.0277)
		}

if v:Team() == 0 && v:IsPlayer() then

	draw.RoundedBox(0,0,0, PlayerPanel:GetWide(), PlayerPanel:GetTall(), Color(180,0,0,255)) -- DRAW THE RED BOX
	local ply = LocalPlayer()

	draw.SimpleText(v:GetName(), "namefont",  math.Round(PlayerPanel:GetWide() * 0.0105),math.Round(PlayerPanel:GetTall() * 0.10),Color(255,255,255)) -- other info
	if v:IsUserGroup("assault") || v:IsUserGroup("heavy") || v:IsUserGroup("scavenger")then 
		draw.SimpleText(v:GetUserGroup(), "DermaDe",  math.Round(PlayerPanel:GetWide() * 0.5805),math.Round(PlayerPanel:GetTall() * 0.40),Color(255,255,255)) -- other info
	end
	draw.RoundedBox(0, math.Round(PlayerPanel:GetWide() * 0.6991),0, 2, PlayerPanel:GetTall(), Color(255,255,255,255))
	draw.RoundedBox(0, math.Round(PlayerPanel:GetWide() * 0.8050),0, 2, PlayerPanel:GetTall(), Color(255,255,255,255))
	draw.RoundedBox(0, math.Round(PlayerPanel:GetWide() * 0.9004),0, 2, PlayerPanel:GetTall(), Color(255,255,255,255))

	draw.SimpleText(v:Frags(), "namefont", math.Round(PlayerPanel:GetWide() * 0.7203),3,Color(255,255,255))
	draw.SimpleText(v:Deaths(), "namefont", math.Round(PlayerPanel:GetWide() * 0.8262),3,Color(255,255,255))
	draw.SimpleText(v:Ping(), "namefont", math.Round(PlayerPanel:GetWide() * 0.9110	),3,Color(255,255,255))
	draw.RoundedBox(0,0,math.Round(PlayerPanel:GetTall() * 0.96666	),PlayerPanel:GetWide() , 1, Color(255,255,255,255))

end
end
draw.RoundedBox(0,0,0, PlayerPanel:GetWide(), PlayerPanel:GetTall(), Color(128,128,128,255))
	draw.SimpleText(v:GetName(), "DeLarge", 10,10,Color(255,255,255))
	draw.RoundedBox(0,math.Round(PlayerPanel:GetWide() * 0.1228),0, 2, PlayerPanel:GetTall(), Color(255,255,255,255))
	draw.RoundedBox(0,math.Round(PlayerPanel:GetWide() * 0.3559),0, 2, PlayerPanel:GetTall(), Color(255,255,255,255))
	draw.RoundedBox(0,math.Round(PlayerPanel:GetWide() * 0.48305),0, 2, PlayerPanel:GetTall(), Color(255,255,255,255))

	draw.SimpleText(v:Ping(), "DeLarge", math.Round(PlayerPanel:GetWide() * 0.50423),math.Round(PlayerPanel:GetTall() * 1),Color(255,255,255))	


end
end
end

-- BLUE SIDE

		Scoreboardblue = vgui.Create("DFrame")
		Scoreboardblue:SetSize(  math.Round(ScrW() * 0.4947),  math.Round(ScrH() * 0.4629) ) -- 950, 500
		Scoreboardblue:SetPos(math.Round(ScrW() * 0.2526),math.Round(ScrH() * 0.2685))
		Scoreboardblue:SetTitle("")
		Scoreboardblue:SetDraggable(false)
		Scoreboardblue:ShowCloseButton(false)
		Scoreboardblue:SetVisible( true )

Scoreboardblue.Paint = function()
	draw.RoundedBox( 0, 0, 0, Scoreboard:GetWide(), Scoreboard:GetTall(), Color( 0,0,0,0) )
    draw.SimpleText(""..BluePlayers.." Players", "namefont", math.Round(ScrW() * 0.25), math.Round(ScrH() * 0.0509),Color(255,255,255))
	draw.SimpleText(""..RedPlayers.." Players", "namefont",  math.Round(ScrW() * 0.0052),math.Round(ScrH() * 0.0509),Color(255,255,255))
	draw.SimpleText("("..Spectators.." Spectators)", "namefont", math.Round(ScrW() * 0.0572),math.Round(ScrH() * 0.0509),Color(255,255,255))
end

local PlayerScrollPanelblue = vgui.Create("DScrollPanel", Scoreboardblue)
PlayerScrollPanelblue:SetSize(math.Round(ScrW() * 0.2458), math.Round(ScrH() * 0.4444))
PlayerScrollPanelblue:SetPos(math.Round(Scoreboardblue:GetWide() * 0.5),math.Round(Scoreboardblue:GetTall() * 0.166)) -- w = 475 , h = 83


local PlayerListblue = vgui.Create("DListLayout", PlayerScrollPanelblue)
PlayerListblue:SetSize(PlayerScrollPanelblue:GetWide(), PlayerScrollPanelblue:GetTall() )
PlayerListblue:SetPos(0,0)



if IsValid(Scoreboardblue) then
PlayerListblue:Clear()
local PLAYERS = player.GetAll()
table.sort( PLAYERS, function( a, b ) return a:Frags() > b:Frags() end )
for k,v in pairs(PLAYERS) do
if v:Team() == 1 && v:IsPlayer() then -- Check for other team
local PlayerPanelblue = vgui.Create("DPanel", PlayerListblue)
PlayerPanelblue:SetSize(PlayerListblue:GetWide(),math.Round(ScrH() * 0.0277))
PlayerPanelblue:SetPos(0,0)
PlayerPanelblue.Paint = function()
local TexturedQuadStructure_blue = {
			texture = surface.GetTextureID( 'custom/smg' ),
			color	= Color( 255, 0, 255, 255 ),
			x 	= math.Round(PlayerPanelblue:GetWide() * 0.6144),
			y 	= 1,
			w 	= math.Round(ScrW() * 0.0208),
			h 	= math.Round(ScrH() * 0.0277)
		}
		
		local heavy_icon_blue = {
			texture = surface.GetTextureID( 'custom/rpg' ),
			color	= Color( 255, 0, 255, 255 ),
			x 	= math.Round(PlayerPanelblue:GetWide() * 0.6144),
			y 	= 1,
			w 	= math.Round(ScrW() * 0.0208),
			h 	= math.Round(ScrH() * 0.0277)
		}
		local scav_icon_blue = {
			texture = surface.GetTextureID( 'custom/crossbow' ),
			color	= Color( 255, 0, 255, 255 ),
			x 	= math.Round(PlayerPanelblue:GetWide() * 0.6144),
			y 	= 1,
			w 	= math.Round(ScrW() * 0.0208),
			h 	= math.Round(ScrH() * 0.0277)
		}
if v:Team() == 1 && v:IsPlayer() then
	local ply = LocalPlayer()
	draw.RoundedBox(0,0,0, PlayerPanelblue:GetWide(), PlayerPanelblue:GetTall(), Color(0,180,255,255)) -- DRAW THE RED BOX
	draw.SimpleText(v:GetName(), "namefont", math.Round(PlayerPanelblue:GetWide() * 0.0105),math.Round(PlayerPanelblue:GetTall() * 0.0561),Color(255,255,255)) -- other info
	if v:IsUserGroup("assault") || v:IsUserGroup("heavy") || v:IsUserGroup("scavenger")then 
		draw.SimpleText(v:GetUserGroup(), "DermaDe",  math.Round(PlayerPanelblue:GetWide() * 0.5805),math.Round(PlayerPanelblue:GetTall() * 0.40),Color(255,255,255)) -- other info
	end
	draw.RoundedBox(0, math.Round(PlayerPanelblue:GetWide() * 0.6947),0,  math.Round(PlayerPanelblue:GetWide() * 0.0042), PlayerPanelblue:GetTall(), Color(255,255,255,255))
	draw.RoundedBox(0, math.Round(PlayerPanelblue:GetWide() * 0.8),0,  math.Round(PlayerPanelblue:GetWide() * 0.0042), PlayerPanelblue:GetTall(), Color(255,255,255,255))
	draw.RoundedBox(0,math.Round(PlayerPanelblue:GetWide() * 0.8947),0, math.Round(PlayerPanelblue:GetWide() * 0.0042), PlayerPanelblue:GetTall(), Color(255,255,255,255))

	draw.SimpleText(v:Frags(), "namefont", math.Round(PlayerPanelblue:GetWide() * 0.7157),math.Round(PlayerPanelblue:GetTall() * 0.0361),Color(255,255,255))
	draw.SimpleText(v:Deaths(), "namefont", math.Round(PlayerPanelblue:GetWide() * 0.8210),math.Round(PlayerPanelblue:GetTall() * 0.0361),Color(255,255,255))
	draw.SimpleText(v:Ping(), "namefont", math.Round(PlayerPanelblue:GetWide() * 0.9052),math.Round(PlayerPanelblue:GetTall() * 0.0361),Color(255,255,255))
	draw.RoundedBox(0,0,29,PlayerPanelblue:GetWide() , 1, Color(255,255,255,255))
end
end
end
end


end


Scoreboard:Show()
Scoreboard:MakePopup()
Scoreboard:SetKeyboardInputEnabled(false)


Scoreboardblue:Show()
Scoreboardblue:MakePopup()
Scoreboardblue:SetKeyboardInputEnabled(false)


end


function GM:ScoreboardHide()
if IsValid(Scoreboard) then
	Scoreboard:Hide()
end
if IsValid(Scoreboardblue) then
Scoreboardblue:Hide()
end
end
