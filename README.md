# Founder of the Final Cult Modding Tools

This repository includes a bunch of example mods that can be used to quickly get started on a new mod.

## Installing Mods

Founder of the Final Cult can load any .zip files that it finds in its mods folder.

## Creating Mods

Prerequisites

- a copy of Founder of the Final Cult
- Clone this repository
- Godot RE Tools, available at https://github.com/GDRETools/gdsdecomp
- Decompile the .exe file of the game, "Cult Survivors.exe", into this repository, you should see a bunch of folders on the same level as this README file

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
