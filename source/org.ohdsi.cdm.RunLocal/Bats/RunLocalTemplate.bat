@echo off
REM === RunLocal.bat ===
REM Start RunLocal.exe with predefined arguments

REM go to current directory
cd /d "%~dp0"

REM check if RunLocal.exe exists
if not exist "RunLocal.exe" (
    echo [Error] RunLocal.exe has not been found in %CD%
    pause
    exit /b 1
)

REM === Start ===
echo [INFO] Starting RunLocal.exe ...
RunLocal.exe ^
  --VendorName="" ^
  --SourceEngine="" ^
  --SourceServer="" ^
  --SourceDatabase="" ^
  --SourceSchema="" ^
  --SourceUser="" ^
  --SourcePassword="" ^
  --DestinationEngine="" ^
  --DestinationServer="" ^
  --DestinationDatabase="" ^
  --DestinationSchema="" ^
  --DestinationUser="" ^
  --DestinationPassword="" ^
  --VocabularyEngine="" ^
  --VocabularyServer="" ^
  --VocabularyDatabase="" ^
  --VocabularySchema="" ^
  --VocabularyUser="" ^
  --VocabularyPassword="" ^
  --EtlLibraryPath="C:\repos\OPEN SOURCE\ETL-LambdaBuilder\MyEtlLibrary" ^
  --ChunkSize="10000" ^
  --ContinueLoadFromChunk="0"

echo.
echo [INFO] Finished with code %ERRORLEVEL%
pause
exit /b %ERRORLEVEL%
