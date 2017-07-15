@echo OFF
@color A
echo ver 0.5dir
echo.
SETLOCAL
set file=%1
for %%i in (%file%) do (
echo filedrive=%%~di
set filedrive=%%~di
echo filepath=%%~pi
set filepath=%%~pi
echo filename=%%~ni
set filename=%%~ni
echo filesize=%%~zi
set filesize=%%~zi
echo fileextension=%%~xi
)
md %filename%
echo.
"C:\Program Files\jpegopt\jpeg-recompress.exe" --accurate --quality high -x 100 %1 %filename%\%filename%-q100.jpg
"C:\Program Files\jpegopt\jpeg-recompress.exe" --accurate --quality high %1 %filename%\%filename%-qhi.jpg
"C:\Program Files\jpegopt\jpeg-recompress.exe" --accurate --quality high -x 85 %1 %filename%\%filename%-q85.jpg
"C:\Program Files\jpegopt\jpeg-recompress.exe" --accurate --quality high -x 80 %1 %filename%\%filename%-q80.jpg
"C:\Program Files\jpegopt\jpeg-recompress.exe" --accurate --quality high -x 75 %1 %filename%\%filename%-q75.jpg
echo.
echo ------------------------------
echo.
for %%i in ("%filename%\%filename%-q100.jpg") do (
echo filesize100=%%~zi
set filesize100=%%~zi
)
for %%i in ("%filename%\%filename%-qhi.jpg") do (
echo filesizehi=%%~zi
set filesizehi=%%~zi
)
for %%i in ("%filename%\%filename%-q85.jpg") do (
echo filesize85=%%~zi
set filesize85=%%~zi
)
for %%i in ("%filename%\%filename%-q80.jpg") do (
echo filesize80=%%~zi
set filesize80=%%~zi
)
for %%i in ("%filename%\%filename%-q75.jpg") do (
echo filesize75=%%~zi
set filesize75=%%~zi
)
echo.
echo ------------------------------
echo.
echo compare 100
"C:\Program Files\jpegopt\jpeg-compare.exe" %1 %filename%\%filename%-q100.jpg > tmpFile
set /p myvar100= < tmpFile
del tmpFile
echo %myvar100%
echo.
echo compare 100 > %filename%\%filename%.txt
echo %myvar100% >> %filename%\%filename%.txt
echo %filesize100% >> %filename%\%filename%.txt
echo. >> %filename%\%filename%.txt
echo compare HI
"C:\Program Files\jpegopt\jpeg-compare.exe" %1 %filename%\%filename%-qhi.jpg > tmpFile
set /p myvarhi= < tmpFile
del tmpFile
echo %myvarhi%
echo.
echo compare HI >> %filename%\%filename%.txt
echo %myvarhi% >> %filename%\%filename%.txt
echo %filesizehi% >> %filename%\%filename%.txt
echo. >> %filename%\%filename%.txt
echo compare q 85
"C:\Program Files\jpegopt\jpeg-compare.exe" %1 %filename%\%filename%-q85.jpg > tmpFile
set /p myvar85= < tmpFile
del tmpFile
echo %myvar85%
echo.
echo compare q 85 >> %filename%\%filename%.txt
echo %myvar85% >> %filename%\%filename%.txt
echo %filesize85% >> %filename%\%filename%.txt
echo. >> %filename%\%filename%.txt
echo compare q 80
"C:\Program Files\jpegopt\jpeg-compare.exe" %1 %filename%\%filename%-q80.jpg > tmpFile
set /p myvar80= < tmpFile
del tmpFile
echo %myvar80%
echo.
echo compare q 80 >> %filename%\%filename%.txt
echo %myvar80% >> %filename%\%filename%.txt
echo %filesize80% >> %filename%\%filename%.txt
echo. >> %filename%\%filename%.txt
echo compare q 75
"C:\Program Files\jpegopt\jpeg-compare.exe" %1 %filename%\%filename%-q75.jpg > tmpFile
set /p myvar75= < tmpFile
del tmpFile
echo %myvar75%
echo.
echo compare q 75 >> %filename%\%filename%.txt
echo %myvar75% >> %filename%\%filename%.txt
echo %filesize75% >> %filename%\%filename%.txt
echo. >> %filename%\%filename%.txt
echo ------------------------------  >> %filename%\%filename%.txt
echo. >> %filename%\%filename%.txt
echo ------------------------------
echo.


if %myvarhi% LSS %myvar85% ( 
set lssvar1=%myvarhi%
set filelssvar1=%filename%-qhi.jpg
) else if %myvarhi% GTR %myvar85% ( 
set lssvar1=%myvar85%
set filelssvar1=%filename%-q85.jpg
) else if %myvarhi% EQU %myvar85% ( 
    if %filesizehi% LEQ %filesize85% (
    set lssvar1=%myvarhi%
    set filelssvar1=%filename%-qhi.jpg
    ) else (
    set lssvar1=%myvar85%
    set filelssvar1=%filename%-q85.jpg
    )    
)
for %%i in ("%filename%\%filelssvar1%") do (
set filesizevar1=%%~zi
)


if %myvar80% LSS %myvar75% ( 
set lssvar2=%myvar80%
set filelssvar2=%filename%-q80.jpg
) else if %myvar80% GTR %myvar75% ( 
set lssvar2=%myvar75%
set filelssvar2=%filename%-q75.jpg
) else if %myvar80% EQU %myvar75% ( 
    if %filesize80% LEQ %filesize75% (
    set lssvar2=%myvar80%
    set filelssvar2=%filename%-q80.jpg
    ) else (
    set lssvar2=%myvar75%
    set filelssvar2=%filename%-q75.jpg
    )  
)
for %%i in ("%filename%\%filelssvar2%") do (
set filesizevar2=%%~zi
)


if %myvar100% LSS %lssvar2% ( 
set lssvar3=%myvar100%
set filelssvar3=%filename%-q100.jpg
) else if %myvar100% GTR %lssvar2% ( 
set lssvar3=%lssvar2%
set filelssvar3=%filelssvar2%
) else if %myvar100% EQU %lssvar2% ( 
    if %filesize100% LEQ %filesizevar2% (
    set lssvar3=%myvar100%
    set filelssvar3=%filename%-q100.jpg
    ) else (
    set lssvar3=%lssvar2%
    set filelssvar3=%filelssvar2%
    )  
)
for %%i in ("%filename%\%filelssvar3%") do (
set filesizevar3=%%~zi
)


if %lssvar1% LSS %lssvar3% ( 
echo %filelssvar1%
echo %filelssvar1% >> %filename%\%filename%.txt
) else if %lssvar1% GTR %lssvar3% ( 
echo %filelssvar3%
echo %filelssvar3% >> %filename%\%filename%.txt
) else if %lssvar1% EQU %lssvar3% ( 
    if %filesizevar3% LEQ %filesizevar1% (
    echo %filelssvar3%
    echo %filelssvar3% >> %filename%\%filename%.txt
    ) else (
    echo %filelssvar1%
    echo %filelssvar1% >> %filename%\%filename%.txt
    )  
)
echo.
echo ------------------------------
echo 
echo 
ENDLOCAL
rem PAUSE