@echo off

REM NetBSD live image build tool
REM need tools
REM sed,curl,git
REM packer,virtualbox,vagrant

REM STEP 1 setup variable

SET IMAGE_DATE=20150927
SET IMAGE_URL="http://teokurebsd.org/netbsd/liveimage/%IMAGE_DATE%/liveimage-i386-emu-%IMAGE_DATE%.img.gz"

SET ARCHIVE_FILE=netbsd_live_image.zip

REM STEP 2 delete old file
del /f /q %ARCHIVE_FILE%

REM STEP 3 Download File
echo Download Image (URL:%IMAGE_URL%)

curl -L %IMAGE_URL% -o %ARCHIVE_FILE%

IF EXIST %ARCHIVE_FILE% (GOTO DOWNLOAD_SUCCESS) ELSE GOTO DOWNLOAD_FAIL

:DOWNLOAD_SUCCESS
echo Download Success at %ARCHIVE_FILE%
:DOWNLOAD_FAIL

REM EOF
echo on
exit
