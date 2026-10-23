REM Go to the dbt project directory
cd /d "C:\Users\JesperStåhl\dbt_projects\demo_project"

echo ================================================
echo	Staring dbt build workfllow ........
echo	Project: demo_project
echo ================================================
echo.

REM run dbt bild (models + tests+ +snapshots)
dbt build

echo ================================================
echo	dbt build finished. 
echo	Exit code: %ERRORLEVEL%
echo ================================================
echo.

pause
endlocal
