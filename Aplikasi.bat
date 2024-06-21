@echo off
git stash
git pull origin main
java -jar -Xss2m -Xms32m -Xmx1024m -XX:PermSize=32m -XX:MaxPermSize=1024m khanza.jar
endlocal