@echo off

setlocal EnableDelayedExpansion

set "userFolder=C:\Users\%username%"

if exist D:\ (
  set "targetDir=D:\SIMRSKhanza"
) else if exist E:\ (
  set "targetDir=E:\SIMRSKhanza"
) else (
  set "targetDir=%userFolder%\SIMRSKhanza"
)

if not exist "!targetDir!" (
  echo Folder "!targetDir!" not found. Exiting...
  exit /b 1
)

pushd "!targetDir!"

  git stash
  git clean -df
  git pull origin main

  java -Xss2m -Xms32m -Xmx1024m -XX:PermSize=32m -XX:MaxPermSize=1024m khanza.jar

popd

endlocal