@echo off
echo MAKE VTOUR (MULTIRES) droplet

IF "%~1" == "" GOTO ERROR
IF NOT EXIST "%~1" GOTO ERROR

"%~dp0\kmakemultires" "%~dp0\templates\vtour-multires.config" %*

echo Making html files
FOR %%a IN (%*) DO copy "%~p1\vtour\tour.html" "%~p1\vtour\%%~na.html"

FOR %%a IN (%*) DO "%~dp0\replace.exe" "%~p1\vtour\%%~na.html"

GOTO DONE

:ERROR
echo.
echo Drag and drop several panoramic images on this droplet to create 
echo automatically a simple virtual tour with multires panos from it.

:DONE
echo.
pause
