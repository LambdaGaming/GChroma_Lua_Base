local function GChroma_Test()
	if GChroma_Loaded then
		local i = 1
		local chroma = GChroma_Start()
		timer.Create( "GChroma_Init", 0.5, 4, function()
			local colors = {
				GCHROMA_COLOR_RED,
				GCHROMA_COLOR_GREEN,
				GCHROMA_COLOR_BLUE
			}
			if i == 4 then
				GChroma_ResetDevice( chroma, GCHROMA_DEVICE_ALL )
				GChroma_CreateEffect( chroma )
				return
			end
			GChroma_SetDeviceColor( chroma, GCHROMA_DEVICE_ALL, colors[i] )
			GChroma_CreateEffect( chroma )
			i = i + 1
		end )
	end
end
concommand.Add( "gchroma_test", GChroma_Test )

local function GChroma_Init()
	if pcall( require, "gchroma" ) then --Make sure the client actually has the dll
		local chroma = GChroma_Start()
		GChroma_ResetDevice( chroma, GCHROMA_DEVICE_ALL ) --Doesn't do anything here but tell the SDK to wake up
		GChroma_CreateEffect( chroma )
		GChroma_Loaded = true
		MsgC( Color( 0, 255, 0 ), "\nGChroma client-side API loaded successfully.\n" )
	else
		chat.AddText( Color( 0, 255, 0 ), "WARNING! GChroma DLL module failed to load. Please follow the install instructions: https://steamcommunity.com/sharedfiles/filedetails/?id=2297412726" )
	end
end
hook.Add( "InitPostEntity", "Chroma_Init", GChroma_Init )

local function GChroma_SendFunctions()
	if GChroma_Loaded then
		local tbl = net.ReadTable()
		local chroma = GChroma_Start()
		for _,v in ipairs( tbl ) do
			if v[1] == GCHROMA_FUNC_DEVICECOLOR then
				GChroma_SetDeviceColor( chroma, v[2], v[3] )
			elseif v[1] == GCHROMA_FUNC_DEVICECOLOREX then
				GChroma_SetDeviceColorEx( chroma, v[2], v[3], v[4], v[5] )
			elseif v[1] == GCHROMA_FUNC_RESETCOLOR then
				GChroma_ResetDevice( chroma, v[2] )
			end
		end
		GChroma_CreateEffect( chroma )
	end
end
net.Receive( "GChroma_SendFunctions", GChroma_SendFunctions )

function GChroma_KeyConvert( key )
	local convert = _G["GCHROMA_KEY_"..input.GetKeyName( key ):upper()]
	if convert == nil then
		return GCHROMA_KEY_INVALID
	end
	return convert
end
