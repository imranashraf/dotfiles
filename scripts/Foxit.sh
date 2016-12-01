#!/bin/bash
# Purpose: To convert Linux-style filename to Windows-style to pass as an argument
# to wine when starting Foxit Reader
Filename="z:"${1//\//\\}
#assuming you use the default installation folder for Foxit in Wine
#App='eval wine "C:\Program Files\Foxit Software\Foxit Reader\Foxit Reader.exe" "'$Filename'"'
#following is for custom installation
App='eval wine "FoxitReader" "'$Filename' " '
$App
