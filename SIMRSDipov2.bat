@echo off
git pull origin main
java -jar -Xss2m -Xms32m -Xmx1024m SIMRSDipov2.jar
endlocal