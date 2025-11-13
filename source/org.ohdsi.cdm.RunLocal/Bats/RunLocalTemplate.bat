chcp 65001 > nul
@echo off
REM === RunLocal.bat ===
REM Move to parent directory
cd ..

REM check if RunLocal.exe exists
if not exist "org.ohdsi.cdm.RunLocal.exe" (
    echo [Error] RunLocal.exe has not been found in the parent directory.
    pause
    exit /b 1
)

REM === Start ===
echo [INFO] Starting RunLocal.exe
echo .
org.ohdsi.cdm.RunLocal.exe ^
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
  --EtlLibraryPath="" ^
  --ChunkSize="1000" ^
  --ContinueLoadFromChunk="0" ^
  --QueryTriesAmount="2" ^
  --QueryTriesDelaySeconds="300" ^
  --MaxMemoryBudgetMb="20000" ^
  --MemoryPerChunkMarginPercent="5"
echo.
echo [INFO] Finished with code %ERRORLEVEL%
pause
exit /b %ERRORLEVEL%
