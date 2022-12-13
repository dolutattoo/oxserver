@echo off

tasklist | find /i "FXServer.exe" && taskkill /im FXServer.exe /F
@echo on
D:\FiveM\fivem-servers\artifacts\6129\FXServer.exe +exec server.cfg