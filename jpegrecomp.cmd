@echo none
cd %1
forfiles /M *.jpg /c "cmd /c @\"C:\Program Files\jpegopt\dirjpgrec.cmd\" @file"
