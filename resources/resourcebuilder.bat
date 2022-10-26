@REM version 0.4.0
@echo off

title Resource Builder
setlocal enabledelayedexpansion

set resources=%cd%

@REM use if resourcebuilder is not in the resouces folder
@REM set resources="YOUR RESOURCES FOLDER HERE"

@cd %resources%

:navigatemenu
   echo.
   cd

   if %cd%==%resources% (
      set count=1
      set options[1]=build all
   ) else (
      set count=2
      set options[1]=return
      set options[2]=build all
   )

   call :loop1

   for /l %%x in (1,1,!count!) do (
      if exist !options[%%x]! (
         cd !options[%%x]!

         call :buildcheck check

         if errorlevel 1 (
            echo [%%x] !options[%%x]! ^| build
         ) else (
            echo [%%x] !options[%%x]!
         )

         cd ..
      ) else (
         echo [%%x] !options[%%x]!
      )
   )

   call :input :navigatemenu

   if !options[%choose%]!==return (
      cd ..
      call :navigatemenu
   )

   if "!options[%choose%]!"=="build all" (
      set all=true
      call :managermenu
   ) else (
      cd !options[%choose%]!

      call :buildcheck check

      if errorlevel 1 (
         set all=false
         set resourcename=!options[%choose%]!
         call :managermenu
      ) else (
         call :navigatemenu
      )
   )
exit /b 0

:managermenu
   echo.
   cd

   set count=3
   set options[1]=cancel
   set options[2]=pnpm
   set options[3]=yarn

   for /l %%x in (1,1,!count!) do (
      echo [%%x] !options[%%x]!
   )

   call :input :managermenu

   if !options[%choose%]!==cancel (
      if %all%==false cd ..
      call :navigatemenu
   ) else (
      set manager=!options[%choose%]!
      if %all%==true (
         set count=0
         call :loop1

         for /l %%x in (1,1,!count!) do (
            cd !options[%%x]!
            call :buildcheck check

            if errorlevel 1 (
               set resourcename=!options[%%x]!
               call :buildcheck build
            ) else (
               call :findresources
            )

            cd ..
         )
      ) else (
         call :buildcheck build
         cd ..
      )
   )

   call :navigatemenu
exit /b 0

:loop1
   for /d %%x in (*) do (
      if not %%x==node_modules (
         cd %%x
         if exist package.json (
            set /a count=!count!+1
            set options[!count!]=%%x
         ) else (
            call :loop2
         )
         cd ..
      )
   )
exit /b 0

:loop2
   for /d %%y in (*) do (
      if not %%y==node_modules (
         cd %%y
         if exist package.json (
            set /a count=!count!+1
            set options[!count!]=%%x
            cd ..
            exit /b 1
         ) else (
            call :loop2
            if errorlevel 1 (
               cd ..
               exit /b 1
            )
         )
         cd ..
      )
   )
exit /b 0

:buildcheck
   if exist fxmanifest.lua (
      set subfolder=
      if exist package.json (
         if %~1==build (
            call :build
         ) else (
            exit /b 1
         )
      ) else (
         for /d %%y in (*) do (
            if not %%y==node_modules (
               cd %%y
               set subfolder=\%%y
               if exist package.json (
                  if %~1==build (
                     call :build
                  ) else (
                     cd ..
                     exit /b 1
                  )
               )
               cd ..
            )
         )
      )
   )
exit /b 0

:input
   echo.
   set choose=
   set /p choose=Choose option:

   if not defined choose (
      echo ERROR invalid input
      goto %~1
   )

   if /i %choose% gtr %count% (
      echo ERROR invalid input
      goto %~1
   )

   if not defined options[%choose%] (
      echo ERROR invalid input
      goto %~1
   )
exit /b 0

:build
   if %manager%==pnpm (
      set command1=%manager% i
   ) else (
      set command1=%manager%
   )
   set command2=%manager% build

   @echo on
   @echo.
   @echo %resourcename%%subfolder%^>%command1%
   @echo.
   @call %command1%
   @echo.
   @echo %resourcename%%subfolder%^>%command2%
   @echo.
   @call %command2%
   @echo off
   copy /y nul ".yarn.installed"
   echo.
exit /b 0

:findresources
   for /d %%y in (*) do (
      cd %%y
      if exist fxmanifest.lua (
         set resourcename=%%y
         if exist package.json (
            call :buildcheck build
         ) else (
            set buildable=false
            for /d %%z in (*) do (
               if not %%z==node_modules (
                  cd %%z
                  if exist package.json set buildable=true
                  cd ..
               )
            )
            if %buildable%==true call :buildcheck build
         )
      ) else (
         call :findresources
      )
      cd ..
   )
exit /b 0