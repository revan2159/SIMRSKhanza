@echo off

setlocal EnableDelayedExpansion

set "userFolder=C:\Users\%username%"

echo.
echo.
echo.
echo **=========================================================================**
echo **Installer SIMRSKhanza Onlaine**
echo **RSU Diponegoro Dua Satu Klaten**
echo **Cahya Revanto**
echo **=========================================================================**
echo.
echo.
echo.

if exist D:\ (
  md D:\SIMRSKhanza
  echo Folder "SIMRSKhanza" created on drive D:
  git clone https://github.com/revan2159/SIMRSKhanza.git D:\SIMRSKhanza
  if %errorlevel% == 0 (
    echo Repository cloned successfully to drive D:!
    echo %userFolder%\Desktop\Aplikasi.bat
    echo "Show in New Window"
    echo.
    pause
    start explorer D:\SIMRSKhanza\
  ) else (
    echo Repository cloning failed! Error code: %errorlevel%
    pause
  )
) else if exist E:\ (
  md E:\SIMRSKhanza
  echo Folder "SIMRSKhanza" created on drive E:
  git clone https://github.com/revan2159/SIMRSKhanza.git E:\SIMRSKhanza
  if %errorlevel% == 0 (
    echo Repository cloned successfully to drive E:!
    echo "Working Directory: E:\SIMRSKhanza"
    echo "Show in New Window"
    echo.
    pause
    start explorer E:\SIMRSKhanza\
  ) else (
    echo Repository cloning failed! Error code: %errorlevel%
    pause
  )
) else (
  md "!userFolder!\SIMRSKhanza"
  echo Folder "SIMRSKhanza" created in user directory
  git clone https://github.com/revan2159/SIMRSKhanza.git "!userFolder!\SIMRSKhanza"
  if %errorlevel% == 0 (
    echo Repository cloned successfully to user directory!
    echo "Working Directory: !userFolder!\SIMRSKhanza"
    echo "Show in New Window"
    echo.
    pause
    start explorer !userFolder!\SIMRSKhanza\
   ) else (
    echo Repository cloning failed! Error code: %errorlevel%
    pause
  )
)

endlocal