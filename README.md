# jpeg-recompress Windows context menu

## a windows command file to use with jpeg-recompress on directories

This uses the jpeg-recompress windows binaries from JPEG Archive utilities: https://github.com/danielgtaylor/jpeg-archive
Windows binaries download: https://github.com/danielgtaylor/jpeg-archive/releases

**! jpeg-recompress is a LOSSY compression. You've been warned! !**

----------------

### Install

**Files needed from JPEG Archive utilities: https://github.com/danielgtaylor/jpeg-archive**
- jpeg-recompress.exe
- jpeg-compare.exe

**Installation:**
- Create a folder in C:\Program Files called "jpegopt" ( C:\Program Files\jpegopt )
- Place there the following files:
- jpeg-recompress.exe
- jpeg-compare.exe
-- dirjpgrec.cmd
-- jpegrecomp.cmd
-- jpegrecomp-register.reg
-- jpegrecomp-unregister.reg

- Double click jpegrecomp-register.reg in order to create values in Windows registry for the context menu (Windows will ask you about permission to install values into Registry).

----------------

### How this command file works

Upon correct installation you can right click on a directory with jpeg files that you want to optimize for web use select the entry **"JPG Recompress"** and it will run **jpeg-recompress** on each file contained creating a directory with the same name. Inside each of those directories there will be copies of the original file with different values of "recompression".

The command file will also run **jpeg-compare** between each one of the recompressed files against the original jpeg file. On Exit in each new diretory there will be a **.txt** file containing info about how each file compares to the original (lower values are better) and also a filename selected which is the file more similar to the original and with smaller file size.

----------------

### Uninstall

- In the "C:\Program Files\jpegopt" double click jpegrecomp-unregister.reg in order to remove the values from the registry
- Delete "jpegopt" directory by hand

----------------

### Disclaimer

I am not responsible for bricked computers, dead hard drives, thermonuclear war,
or you getting fired because you ruined your work PC. Please do some research and
if you have any concerns DO NOT USE this command file or the mentioned utilities. 

----------------

### License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.







