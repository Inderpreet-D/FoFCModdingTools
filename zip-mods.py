import sys
import platform
import shutil
import os
import subprocess


WINDOWS_DEST = "%APPDATA%\\Founder of the Final Cult\\mods\\"
LINUX_DEST = "~/.local/share/Founder of the Final Cult/mods/"
MAC_DEST = "~/Library/Application Support/Founder of the Final Cult/mods/"


def main():
  if len(sys.argv) < 2:
    print("Usage: zip-mods.py <mod-directory>")
    return
  
  system = platform.system()
  if system == "Windows":
    dest = WINDOWS_DEST
  elif system == "Linux":
    dest = os.path.expanduser(LINUX_DEST)
  elif system == "Darwin":
    dest = os.path.expanduser(MAC_DEST)
  else:
    print(f"Unsupported OS: {system}")
    return

  mod_dirs = sys.argv[1:]
  for i in range(len(mod_dirs)):
    mod_dir = mod_dirs[i]
    print(f"Zipping mod directory: {mod_dir}")

    if system == "Windows":
      subprocess.run(["powershell", "Compress-Archive", "-Path", mod_dir, "-DestinationPath", f"{mod_dir}.zip"])
    else:
      subprocess.run(["zip", "-r", f"{mod_dir}.zip", mod_dir])

    if os.path.exists(f"{dest}{mod_dir}.zip"):
      os.remove(f"{dest}{mod_dir}.zip")
    
    shutil.move(f"{mod_dir}.zip", dest)
    print(f"Created zip archive at {dest}{mod_dir}.zip")
    
    if i < len(mod_dirs) - 1:
      print("")


if __name__ == "__main__":
  main()