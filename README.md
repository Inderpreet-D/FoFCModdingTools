# Founder of the Final Cult Modding Tools

This repository includes a bunch of example mods that can be used to quickly get started on a new mod. Every example has a separate folder that ends in Mod, like `CursorMod` for example, and an accompanying json file, like `CursorMod.json`.

# Table of Contents

[1. Installing Mods](#installing-mods) <br>
[2. Creating Mods](#creating-mods) <br>
[3. FAQs](#faqs)

## Installing Mods

Founder of the Final Cult will load any .zip files that it finds in its `mods` folder along with any extra mod information found in accompanying .json files.

You can get to this mods folder by starting the game, selecting "Mods" on the main menu and the clicking on "Open Mods Folder".

### Finding Mods

Mods will be hosted on the game's Discord server, you can find a link to it on the main menu, in the bottom right corner.

## Creating Mods

### Prerequisites

- Founder of the Final Cult
- Clone this repository
- Godot RE Tools, available at https://github.com/GDRETools/gdsdecomp
- Decompile the .exe file of the game, "Cult Survivors.exe", into this repository, you should see a bunch of folders on the same level as this README file

### Structure

Mod contents for a mod called "ExampleMod" should be organized as follows:

1. All files should be contained in a folder called ExampleMod
2. ExampleMod has to contain a `main.gd` file with at least the following contents

```
extends BaseMod

func init_mod() -> void:
	pass
```

3. Optionally an `ExampleMod.json` file can be created to hold any metadata for the mod like `name`, `version`, `description` as well as any extra data you want to be visible to players.
   - `name`, `version`, and `description` will automatically show up on the Mods screen
   - Extra data will show up when the player click on the button to show extra mod info / settings
   - Extra data should be key-value pairs of strings only, for example: `"Load Order": "This mod should be loaded before all other mods"`
4. The ExampleMod folder should then be made into a .zip file and placed into the mods folder.
   - Refer to [Packaging Mods](#packaging-mods) for how to do this automatically.
5. The folder containing `main.gd`, the .zip file, and the .json file (if present) have to have the exact same name.

As the game loads this mod it will call the defined `init_mod()` function.
You can use this function to interact with any of the classes of the game to add extra content.
For example, you can use this function to:

- instantiate a scene and add it as a child of any nodes
- register callbacks for signals
- add new definitions for Backgrounds, Game Modes, Levels, etc.
- modify any existing globals

### Packaging Mods

After you have created a mod you can run `python pack-mods.py YourModName` to package the mod as a zip file and move it and it's json file (if present) to the correct directory to be loaded by the game. This assumes that you have python 3 installed.

### Sharing Mods

Mods can be shared through the Discord server for now. You can join the server from the icon on the main menu.

## FAQs

1. How do I do (some specific thing)?

   - The example mods in this repo show how to add new items, characters, enemies, weapons, so those are a good starting point
   - If you have more complex questions or things not covered by the examples then please ask questions in the Discord server to get help with understanding how the game works

2. What do I need to know to make a mod?

   - Some scripting knowledge and understanding of Godot is required, but it is a very user friendly game engine and you can always use the included example mods as a starting point

3. What do I do if an error is preventing me from getting to the main menu and disabling a mod?
   - Got to the data folder for this game and edit the modlist.json file to disable the mod that is causing the error
   - The data folder can be found in the following locations based on what operating system you are using:
     - Windows: `%APPDATA%\Founder of the Final Cult`
     - MacOS: `~/Library/Application Support/Founder of the Final Cult`
     - Linux: `~/.local/share/Founder of the Final Cult`
