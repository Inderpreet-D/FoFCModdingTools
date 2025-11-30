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
    print("Usage: zip-mods.py <mod-directory-1, mod-directory-2, ...>")
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

  # Create zip archives for each mod directory
  mod_dirs = sys.argv[1:]
  for i in range(len(mod_dirs)):
    mod_dir = mod_dirs[i]
    print(f"Zipping mod directory: {mod_dir}")

    if system == "Windows":
      # Use PowerShell Compress-Archive cmdlet on Windows
      subprocess.run(["powershell", "Compress-Archive", "-Path", mod_dir, "-DestinationPath", f"{mod_dir}.zip"])
    else:
      # Use zip command on Linux and macOS
      subprocess.run(["zip", "-r", f"{mod_dir}.zip", mod_dir])
    
    # Ensure destination directory exists
    os.makedirs(dest, exist_ok=True)

    # Delete existing zip at destination if it exists
    if os.path.exists(f"{dest}{mod_dir}.zip"):
      os.remove(f"{dest}{mod_dir}.zip")
    
    # Move the created zip to the destination directory
    shutil.move(f"{mod_dir}.zip", dest)

    print(f"Created zip archive at {dest}{mod_dir}.zip")
    if i < len(mod_dirs) - 1:
      print("")


if __name__ == "__main__":
  main()