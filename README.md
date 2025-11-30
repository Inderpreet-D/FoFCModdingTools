# Founder of the Final Cult Modding Tools

This repository includes a bunch of example mods that can be used to quickly get started on a new mod. Every example has a separate folder that ends in Mod, like CursorMod for example.

## Creating Mods

### Prerequisites

- Get a copy of Founder of the Final Cult
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

3. The ExampleMod folder should then be made into a .zip file and placed into the mods folder.
4. The folder containing `main.gd` and the .zip file have to have the exact same name.

As the game loads this mod it will call the defined `init_mod()` function.
You can use this function to interact with any of the classes of the game to add extra content.
For example, you can use this function to:

- instantiate a scene and add it as a child of any nodes
- register callbacks for signals
- add new definitions for Backgrounds, Game Modes, Levels, etc.

## Installing Mods

Founder of the Final Cult can load any .zip files that it finds in its mods folder.

### Packaging Mods

After you have created a mod you can run `python zip-mods.py YourModName` to package the mod as a zip file and move it to the correct directory to be loaded by the game. This assumes that you have python 3 installed.

### Sharing Mods

Mods can be shared through the Discord server for now. You can join the server from the icon on the main menu.

## FAQs

1. How do I do (some specific thing)?

- You can ask questions in the Discord to get help with understanding how the game works.

2. What do I need to know to make a mod?

- Some scripting knowledge and understanding of Godot is required, but it is a very user friendly game engine and you can always use the included example mods as a starting point.

3. What do I do if an error is preventing me from getting to the main menu and disabling a mod?

- Got to the data folder for this game and edit the modlist.json file to disable the mod that is causing the error
- The data folder can be found in the following locations based on what operating system you are using:
  - Windows: `%APPDATA%\Founder of the Final Cult`
  - MacOS: `~/Library/Application Support/Founder of the Final Cult`
  - Linux: `~/.local/share/Founder of the Final Cult`
