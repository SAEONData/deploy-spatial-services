@echo off

set BASELOG=LOG
set BACKUPDIR=Y:\postgres_dump_app01\2019_MIGRATION\
set PGHOST=localhost
set PGUSER=postgres
set PGPASSWORD=postgres
set PGBIN="C:\Program Files\PostgreSQL\9.1\bin_8.4\"
set FILELOG=log.txt

set BACKUPDIRDATE="%BACKUPDIR%%date%/"
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
 set dow=%%i
 set month=%%j
 set day=%%k
 set year=%%l
)
if not exist %BACKUPDIRDATE% mkdir %BACKUPDIRDATE%



if exist dbs.lst del dbs.lst
%PGBIN%psql -h %PGHOST% -p 5432 -U %PGUSER% -c "SELECT datname FROM pg_database WHERE datistemplate = false;" -o "dbs.lst"

for /f %%a IN (dbs.lst) DO (

    echo Backup start %date%  %time%
    %PGBIN%pg_dump -w -i -h %PGHOST% -U %PGUSER% -F c -b -v -f "%BACKUPDIRDATE%-%%a.compressed" %%a
    echo End of backup %BASELOG%

)

