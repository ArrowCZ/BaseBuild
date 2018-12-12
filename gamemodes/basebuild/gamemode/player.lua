local ply = FindMetaTable("Player")

function ply:SetGamemodeTeam( n )

	
	self:SetTeam( n )
	
	if n == 0 then
	    self:SetPlayerColor( Vector( 1.0, .2, .2) )	
	elseif n == 1 then
	    self:SetPlayerColor( Vector( .2, .2, 1.0) )
	end
	
	return true
end