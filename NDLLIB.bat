@echo off
set arg1=%1

if /i "%arg1%"=="add" goto :add
if /i "%arg1%"=="get" goto :get
if /i "%arg1%"=="list" goto :list
if /i "%arg1%"=="remove" goto :remove
if /i "%arg1%"=="update" goto :update

echo 	Add [Library Name] [New File Name]; 		Adds source library to the index
echo 	Get [Library Name]; 				Adds the target library to the current directory under folder 'lib'
echo 	Remove [Library Name]; 				Removes the target library from the index
echo 	List; 						Lists the libraries currently indexed
echo 	Update;						Updates libraries within the current directory's 'lib' folder
goto :eof

:add
set sourceLib=%2
if not "%3"=="" (
	xcopy /f /y "%cd%\%sourceLib%" "%UserProfile%\Libraries\%3*"
)
else (
	xcopy /f /y "%cd%\%sourceLib%" "%UserProfile%\Libraries"
)
goto :eof

:get
set sourceLib=%2
set destination=%3
echo "Adding %sourceLib% to 'lib' folder"
xcopy /f /y "%UserProfile%\Libraries\%sourceLib%" "%cd%\lib\%destination%"
goto :eof

:list
cd "%UserProfile%\Libraries"
dir /b
goto :eof

:remove
set targetLib=%2
cd "%UserProfile%\Libraries"
del %targetLib%
goto :eof

:update
xcopy /y /u "%UserProfile%\Libraries\" "%cd%\lib"
goto :eof
