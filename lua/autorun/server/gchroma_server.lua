local function GChroma_Init()
	GChroma_Loaded = true
	MsgC( Color( 0, 255, 0 ), "\nGChroma server-side API loaded successfully.\n" )
end
hook.Add( "InitPostEntity", "Chroma_Init", GChroma_Init )

function GChroma_SetDeviceColor( device, color )
	return { GCHROMA_FUNC_DEVICECOLOR, device, color }
end

function GChroma_SetDeviceColorEx( device, color, row, col )
	return { GCHROMA_FUNC_DEVICECOLOREX, device, color, row, col }
end

function GChroma_ResetDevice( device )
	return { GCHROMA_FUNC_RESETCOLOR, device }
end

util.AddNetworkString( "GChroma_SendFunctions" )
function GChroma_SendFunctions( ply, tbl )
	net.Start( "GChroma_SendFunctions" )
	net.WriteTable( tbl )
	net.Send( ply )
end
