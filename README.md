# noapp2cdn_android

## Installation

1. Install Termux.

2. Copy the "noapp2cdn_android" folder to the root of internal storage.

3. Open Termux and run:

termux-setup-storage

(When prompted, allow Termux to access all files on your device storage.)

4. Start noapp2cdn:

bash ~/storage/shared/noapp2cdn_android/noapp2cdn.sh

(The scripts can be launched from any location in Termux.)

5. IMPORTANT:

For the first use, before preparing any CDN folder, select:

9 = Run first-time setup (required before first use)

This step prepares the project folders and configures the Termux environment.

The first-time setup must be completed before the first preparation.

---

## Menu

When started, noapp2cdn.sh provides the following options:

1 = Prepare CDN folders

9 = Run first-time setup (required before first use)

0 = Exit

---

## Prepare CDN Folders

Place one game CDN folder per game inside:

auto_prepare/

When option 1 is selected, the script automatically:

- Searches all folders inside auto_prepare/
- Adds the .app extension to files that do not already have an extension
- Searches for the highest numbered tmd.NUMBER file
- Renames the highest numbered TMD file to title.tmd
- Leaves all other files untouched

Folders are modified directly inside auto_prepare/.

No files are copied or moved outside the folder being prepared.

---

## Input

Place one game CDN folder per game inside:

auto_prepare/

Example:

auto_prepare/

---- game1/

-------- 00000000

-------- 00000001

-------- 00000002

-------- tmd.0

-------- tmd.1040

---- game2/

-------- 00000000

-------- 00000001

-------- tmd.0

---

## Output

The folders inside auto_prepare/ are modified in place.

Files without an extension are renamed with:

.app

added to the filename.

Example:

00000000

becomes:

00000000.app

The highest numbered:

tmd.NUMBER

file is renamed to:

title.tmd

Example:

tmd.1040

becomes:

title.tmd

---

## Folder Structures

### Folder Structure Before Preparation

noapp2cdn_android/

---- README.md

---- noapp2cdn.sh

---- noapp2cdn_setup.sh

---- auto_prepare/

-------- game1/

------------ 00000000

------------ 00000001

------------ 00000002

------------ tmd.0

------------ tmd.1040

-------- game2/

------------ 00000000

------------ 00000001

------------ tmd.0

---

### Folder Structure After Preparation

noapp2cdn_android/

---- README.md

---- noapp2cdn.sh

---- noapp2cdn_setup.sh

---- auto_prepare/

-------- game1/

------------ 00000000.app

------------ 00000001.app

------------ 00000002.app

------------ tmd.0

------------ title.tmd

-------- game2/

------------ 00000000.app

------------ 00000001.app

------------ title.tmd

---

## Notes

The required folders are automatically created if they do not already exist.

Folders that already contain title.tmd and no files without an extension are automatically skipped.

Folders that are only partially prepared are automatically completed.

The original file contents are never modified.

Only file names are changed.

The script always uses the highest numbered tmd.NUMBER file when creating title.tmd.

If no valid tmd.NUMBER file exists, a warning is displayed and the folder is left unchanged.

This tool is intended to prepare CDN folders for use with tools that require:

- .app file extensions
- title.tmd naming

---

## Credits

This repository provides an Android/Termux workflow for preparing CDN folders by automatically adding .app extensions and creating title.tmd from the highest numbered TMD file.
