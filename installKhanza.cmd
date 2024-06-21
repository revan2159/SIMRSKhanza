@echo off

setlocal EnableDelayedExpansion

set "userFolder=C:\Users\%username%"
set "desktopFolder=%userFolder%\Desktop"

@REM run the script as administrator
if not "%1"=="am_admin" (
    powershell start -verb runas '%0' am_admin
    exit /b
)
echo.
echo.
echo.
echo **=========================================================================**
echo ** Installer SIMRSKhanza Online**
echo ** RSU Diponegoro Dua Satu Klaten**
echo ** Cahya Revanto**
echo **=========================================================================**
echo.
echo.
echo.

rem Function to clone the repository to a specific folder and create a shortcut
:cloneRepo
if exist "%1" (
    md "%1\SIMRSKhanza"
    echo Folder "SIMRSKhanza" created in %1
    git clone https://github.com/revan2159/SIMRSKhanza.git "%1\SIMRSKhanza"
    if %errorlevel% == 0 (
        echo Repository cloned successfully to %1!
        echo.
        echo Copying the required files to the Java bin folder...
        xcopy /s /y "%1\SIMRSKhanza\lib\*" "%ProgramFiles%\BellSoft\LibericaJDK-15-Full\bin"
        echo.
        echo "Working Directory: %1\SIMRSKhanza"
        echo "Show in New Window"
        echo.
        pause
        start explorer "%1\SIMRSKhanza"
        exit /b 0
    ) else (
        echo Repository cloning failed! Error code: %errorlevel%
        pause
        exit /b 1
    )
)

rem Check for Git and Java installation
if exist "%ProgramFiles%\Git\cmd\git.exe" (
    echo Git is already installed.
    for /f "tokens=*" %%i in ('git --version') do echo %%i
    echo.
    if exist "%ProgramFiles%\BellSoft\LibericaJDK-15-Full\bin\java.exe" (
        echo Java is already installed.
        for /f "tokens=*" %%i in ('java --version') do echo %%i
        echo.
        timeout /t 3
        echo Memulai Instal SIMRSKhanza...
        echo.
        call :cloneRepo D:
        if %errorlevel% neq 0 call :cloneRepo E:
        if %errorlevel% neq 0 call :cloneRepo "!userFolder!"
    ) else (
        echo Java is not installed. Installing Java using Winget...
        echo.
        winget install --id BellSoft.LibericaJDK.15.Full -e --source winget
        if %errorlevel% == 0 (
            echo Java installation successful!
            @REM Create system environment variable for "JAVA_HOME" and add it to PATH
            setx JAVA_HOME "%ProgramFiles%\BellSoft\LibericaJDK-15-Full" /m
            rem Add Java to PATH for the current session
            set "PATH=%ProgramFiles%\BellSoft\LibericaJDK-15-Full\bin;%PATH%"
            for /f "tokens=*" %%i in ('java --version') do echo %%i
            echo.
            timeout /t 3
            echo Memulai Instal SIMRSKhanza...
            echo.
            call :cloneRepo D:
            if %errorlevel% neq 0 call :cloneRepo E:
            if %errorlevel% neq 0 call :cloneRepo "!userFolder!"
        ) else (
            echo Java installation failed! Error code: %errorlevel%
            pause
            exit /b 1
        )
    )
) else (
    echo Git is not installed. Installing Git using Winget...
        winget install --id Git.Git -e --source winget
        if %errorlevel% == 0 (
            echo Git installation successful!
            rem Add Git to PATH for the current session
            set "PATH=%ProgramFiles%\Git\cmd;%PATH%"
            for /f "tokens=*" %%i in ('git --version') do echo %%i
            echo.
            if not exist "%ProgramFiles%\BellSoft\LibericaJDK-15-Full\bin\java.exe" (
            echo Java is not installed. Installing Java using Winget...
            echo.
            winget install --id BellSoft.LibericaJDK.15.Full -e --source winget
                if %errorlevel% == 0 (
                echo Java installation successful!
                @REM Create system environment variable for "JAVA_HOME" and add it to PATH
                setx JAVA_HOME "%ProgramFiles%\BellSoft\LibericaJDK-15-Full" /m
                rem Add Java to PATH for the current session
                set "PATH=%ProgramFiles%\BellSoft\LibericaJDK-15-Full\bin;%PATH%"
                for /f "tokens=*" %%i in ('java --version') do echo %%i
                echo.
                timeout /t 3
                echo Memulai Instal SIMRSKhanza...
                echo.
                call :cloneRepo D:
                if %errorlevel% neq 0 call :cloneRepo E:
                if %errorlevel% neq 0 call :cloneRepo "!userFolder!"
            ) else (
                echo Java installation failed! Error code: %errorlevel%
                pause
                exit /b 1
            )
        ) else (
            echo Java is already installed.
            for /f "tokens=*" %%i in ('java --version') do echo %%i
            echo.
            timeout /t 3
            echo Memulai Instal SIMRSKhanza...
            echo.
            call :cloneRepo D:
            if %errorlevel% neq 0 call :cloneRepo E:
            if %errorlevel% neq 0 call :cloneRepo "!userFolder!"
        )
    ) else (
        echo Git installation failed! Error code: %errorlevel%
        pause
        exit /b 1
    )
)

endlocal
