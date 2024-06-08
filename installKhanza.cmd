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
    echo Creating desktop shortcut...
    echo %userFolder%\Desktop\Aplikasi.bat
    echo "D:\SIMRSKhanza\Aplikasi.bat"
    echo "Working Directory: D:\SIMRSKhanza"
    echo "Show in New Window"
    echo.
    mklink /h D:\Desktop\Aplikasi.bat D:\SIMRSKhanza\Aplikasi.bat
    if %errorlevel% == 0 (
      echo Shortcut created successfully!
      pause
    ) else (
      echo Shortcut creation failed! Error code: %errorlevel%
      pause
    )
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
    echo Creating desktop shortcut...
    echo %userFolder%\Desktop\Aplikasi.bat
    echo "E:\SIMRSKhanza\Aplikasi.bat"
    echo "Working Directory: E:\SIMRSKhanza"
    echo "Show in New Window"
    echo.
    mklink /h "%userFolder%\Desktop\Aplikasi.bat" "E:\SIMRSKhanza\Aplikasi.bat"
    if %errorlevel% == 0 (
      echo Shortcut created successfully!
      pause
    ) else (
      echo Shortcut creation failed! Error code: %errorlevel%
      pause
    )
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
    echo Creating desktop shortcut...
    echo %userFolder%\Desktop\Aplikasi.bat
    echo "!userFolder!\SIMRSKhanza\Aplikasi.bat"
    echo "Working Directory: !userFolder!\SIMRSKhanza"
    echo "Show in New Window"
    echo.
    mklink /h "%userFolder%\Desktop\Aplikasi.bat" "!userFolder!\SIMRSKhanza\Aplikasi.bat"
    if %errorlevel% == 0 (
      echo Shortcut created successfully!
      pause
    ) else (
      echo Shortcut creation failed! Error code: %errorlevel%
      pause
    )
  ) else (
    echo Repository cloning failed! Error code: %errorlevel%
    pause
  )
)

endlocal