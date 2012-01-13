@echo off
rem ----------------------------------------
rem Setup C::B root folder of *binaries* (!)
rem ----------------------------------------
set CB_ROOT=C:\Devel\CodeBlocks
rem ------------------------------------------
rem Setup GCC root folder with "bin" subfolder
rem ------------------------------------------
set GCC_ROOT=C:\Devel\GCC46TDM

rem -------------------------------------------
rem Usually below here no changes are required.
rem -------------------------------------------
if not exist "%CB_ROOT%"  goto ErrNoCB
if not exist "%GCC_ROOT%" goto ErrNoGCC
set PATH=%CB_ROOT%;%GCC_ROOT%;%PATH%

set START_CMD=start "Code::Blocks Build" /D%~dp0 /min /b

%START_CMD% "%CB_ROOT%\codeblocks.exe" --batch-build-notify --no-batch-window-close --target=All --build "%~dp0CodeBlocks.cbp"
echo Do not forget to run "update.bat" after successful build!
goto TheEnd

:ErrNoCB
echo Error: C::B root folder not found. Adjust batch file accordingly
goto TheEnd

:ErrNoGCC
echo Error: GCC root folder not found. Adjust batch file accordingly
goto TheEnd

:TheEnd