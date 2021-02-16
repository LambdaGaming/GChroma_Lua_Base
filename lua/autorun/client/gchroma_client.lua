if pcall( require, "gchroma" ) then --Make sure the client actually has the dll
	gchroma.Loaded = true
end

local function GChroma_Test()
	if gchroma.Loaded then
		local i = 1
		timer.Create( "GChroma_Init", 0.5, 4, function()
			local colors = {
				GCHROMA_COLOR_RED,
				GCHROMA_COLOR_GREEN,
				GCHROMA_COLOR_BLUE
			}
			if i == 4 then
				gchroma.ResetDevice( chroma, GCHROMA_DEVICE_ALL )
				gchroma.CreateEffect( chroma )
				return
			end
			gchroma.SetDeviceColor( chroma, GCHROMA_DEVICE_ALL, colors[i] )
			gchroma.CreateEffect( chroma )
			i = i + 1
		end )
	end
end
concommand.Add( "gchroma_test", GChroma_Test )

local function GChroma_Init()
	if gchroma.Loaded then
		gchroma.ResetDevice( GCHROMA_DEVICE_ALL ) --Doesn't do anything here but tell the SDK to wake up
		gchroma.CreateEffect()
		MsgC( Color( 0, 255, 0 ), "\nGChroma client-side API loaded successfully.\n" )
	else
		chat.AddText( Color( 0, 255, 0 ), "WARNING! GChroma DLL module failed to load. Please follow the install instructions: https://steamcommunity.com/sharedfiles/filedetails/?id=2297412726" )
	end
end
hook.Add( "InitPostEntity", "Chroma_Init", GChroma_Init )

local function SendFunctions()
	if gchroma.Loaded then
		local tbl = net.ReadTable()
		for _,v in ipairs( tbl ) do
			if v[1] == GCHROMA_FUNC_DEVICECOLOR then
				gchroma.SetDeviceColor( v[2], v[3] )
			elseif v[1] == GCHROMA_FUNC_DEVICECOLOREX then
				gchroma.SetDeviceColorEx( v[2], v[3], v[4], v[5] )
			elseif v[1] == GCHROMA_FUNC_RESETCOLOR then
				gchroma.ResetDevice( v[2] )
			end
		end
		gchroma.CreateEffect()
	end
end
net.Receive( "GChroma_SendFunctions", SendFunctions )

function gchroma.KeyConvert( key )
	local convert = _G["GCHROMA_KEY_"..input.GetKeyName( key ):upper()]
	if convert == nil then
		return GCHROMA_KEY_INVALID
	end
	return convert
end
