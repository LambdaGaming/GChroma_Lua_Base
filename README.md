![GChroma Logo](logo.png)

# About
 GChroma is a link between Garry's Mod and Razer Synapse. It allows developers to integrate Chroma support into their addons through Lua. This addon is the base used to initialize and test the binary module. See [this collection]() for GChroma-compatible addons. If you are a developer interested in adding GChroma support to your addon, or making an addon specifically for GChroma, info about that can be found [here.](https://github.com/LambdaGaming/GChroma)

&nbsp;

# Note
 This addon is still in early development, so expect bugs, crashes, performance issues, all that jazz.

&nbsp;

# Suggestions/Bugs/Contributions
 If you have a suggestion or want to report a bug, create an issue here or comment on the [workshop page.](https://steamcommunity.com/sharedfiles/filedetails/?id=2297412726) If you would like to contribute to this addon or the binary module, please read the [contributing guidelines](https://github.com/LambdaGaming/GChroma/blob/main/CONTRIBUTING.md) before creating a pull request.

&nbsp;

# Installing
 1. Make sure you have Razer Synapse 3 installed and running with the Chroma Connect module installed as well, and obviously make sure you have a device that supports Razer Synapse 3. (Legacy Synapse versions might work but are unsupported by me.)
 2. Download the GChroma base addon from [here.](https://steamcommunity.com/sharedfiles/filedetails/?id=2297412726)
 3. Download the latest GChroma binary module from [here.](https://github.com/LambdaGaming/GChroma/releases) Make sure you download the 32-bit version unless you're running the x86-64 branch.
 4. Move the downloaded binary module to `steamapps/common/garrysmod/garrysmod/lua/bin`. You may have to create the bin folder yourself.
 5. Download GChroma-supported addons from [here](), or start developing your own. Enjoy!

&nbsp;

# FAQs
 ## Does this work on servers?
 Yes, but the server needs to have the base addon for it to work on your end.

 ## Is support for Linux/Mac planned?
 Currently, no. This is partly due to Razer Synapse only natively supporting Windows.

 ## Does this work on beta branches of the game?
 It works on the x86-64 branch. Other branches haven't been tested.

 ## Is animation support planned?
 No, and it probably never will be, but we'll see. The way animations currently work is a bit complex. It would be hard to integrate it without making the code overly complex on the Lua side.

 ## Does this work with 3rd party devices?
 If your RGB software is picked up by Razer Synapse as a device there's a good chance it will work. MSI MysticLight seems to work as long as you turn on Game Sync.

&nbsp;

# Legal
 - All GChroma content made by me, [Source 2 Gman](https://steamcommunity.com/profiles/76561198136556075), AKA [LambdaGaming](https://github.com/LambdaGaming) is licensed under the [MIT license.](https://github.com/LambdaGaming/GChroma/blob/main/LICENSE)
 - RAZER is the registered trademark of Razer Inc. Razer has no affiliation whatsoever with me or my addons.
