@echo off
setlocal enabledelayedexpansion

set prefix=chapter
set pad=3

for /l %%i in (1,1,12) do (
    set padnum=000000%%i
    mkdir !prefix!!padnum:~-%pad%!
)

endlocal

