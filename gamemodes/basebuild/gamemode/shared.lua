GM.Name = "BaseBuild"
GM.Author = "ArrowCZ"
GM.Email = "N/A"
GM.Website = "N/A"

TEAM_1 = 0
TEAM_2 = 1
TEAM_SPEC = 2

----------Colors---------
local clrTable = {} //Color table
clrTable["Green"] = Color(20, 150, 20, 255)
clrTable["Blue"] = Color(25, 25, 170, 255)
clrTable["Red"] = Color(150, 20, 20, 255)
clrTable["Brown"] = Color(102, 34, 0, 255)
-------------------------


function GM:Initialize()
  -- Do stuff
   self.BaseClass.Initialize( self )
end

team.SetUp( 0, "Alpha", Color(255, 0, 0) )
team.SetUp( 1, "Bravo", Color(0, 0, 255) )
team.SetUp( 2, "Spectator", Color(128, 128, 128) )


