gchroma = {}

local function GChroma_Init()
	MsgC( Color( 0, 255, 0 ), "\nGChroma server-side API loaded successfully.\n" )
end
hook.Add( "InitPostEntity", "Chroma_Init", GChroma_Init )

function gchroma.SetDeviceColor( device, color )
	return { GCHROMA_FUNC_DEVICECOLOR, device, color }
end

function gchroma.SetDeviceColorEx( device, color, row, col )
	return { GCHROMA_FUNC_DEVICECOLOREX, device, color, row, col }
end

function gchroma.ResetDevice( device )
	return { GCHROMA_FUNC_RESETCOLOR, device }
end

function gchroma.ToVector( color )
	return Vector( color.r, color.g, color.b )
end

util.AddNetworkString( "GChroma_SendFunctions" )
function gchroma.SendFunctions( ply, tbl )
	net.Start( "GChroma_SendFunctions" )
	net.WriteTable( tbl )
	net.Send( ply )
end
