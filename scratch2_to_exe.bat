@ECHO OFF
SETLOCAL ENABLEDDELAYEDEXPANSION 
CLS
ECHO Batch file to convert Scratch 2 files (.sb2) to SWF then to EXE
ECHO.

REM Set required file variables
SET FLASH=flashplayer_32_sa.exe
SET CONVERT=Converter.swf

REM Sanity check for required files
IF NOT EXIST bin\%FLASH% GOTO NOFLASH
IF NOT EXIST bin\%CONVERT% GOTO NOCONVERT

REM Run the SB2 to SWF converter
CD bin
%FLASH% Converter.swf
CD ..

REM Gets swf filesize and converts it to hex
IF NOT EXIST *.swf GOTO NOSWF
FOR %%I IN (*.swf) DO (
SET DEC=%%~zI
SET FIL=%%~nI)
cmd /C EXIT %DEC%
SET "HEX=%=ExitCode%"
FOR /F "tokens=* delims=0" %%Z IN ("%HEX%") DO SET "HEX=%%Z"

REM Create file with magic number and coded hex file size
SET A=%HEX:~0,2%
SET B=%HEX:~2,2%
SET C=%HEX:~4,2%
SET D=%HEX:~6,2%
(ECHO 0000  56 34 12 FA %D% %C% %B% %A% 00 )  >temp.hex
CERTUTIL -f -decodehex "temp.hex" tmp.hex

REM Combines flash player, swf file, and coded hex file into an EXE
COPY /B /Y bin\%FLASH%+%FIL%.swf+tmp.hex %FIL%.exe

REM Cleans up temp files
DEL *.hex
GOTO END

:NOSWF
ECHO SWF file is missing.
GOTO END

:NOFLASH
ECHO %FLASH% Flash Player projector file is missing.
ECHO.
ECHO Download the Flash Player projector at
ECHO https://www.adobe.com/support/flashplayer/debug_downloads.html
GOTO END

:NOCONVERT
ECHO Converter.swf file is missing.
ECHO.
ECHO Download Converter.swf from https://asentientbot.github.io/
GOTO END

:END
PAUSE
