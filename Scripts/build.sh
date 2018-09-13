#! /bin/sh

project="<asdf1324>"

echo "Attempting to build $project for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath=$(pwd)/asdf \
  -buildWindowsPlayer "$(pwd)/asdf/Build/windows/$project.exe" \
  -quit

echo "Attempting to build $project for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath=$(pwd)/asdf \
  -buildOSXUniversalPlayer "$(pwd)/asdf/Build/osx/$project.app" \
  -quit

#echo "Attempting to build $project for Linux"
#/Applications/Unity/Unity.app/Contents/MacOS/Unity \
#  -batchmode \
#  -nographics \
#  -silent-crashes \
#  -logFile $(pwd)/unity.log \
#  -projectPath=$(pwd)/asdf \
#  -buildLinuxUniversalPlayer "$(pwd)/asdf/Build/linux/$project.exe" \
#  -quit

echo 'Logs from build'
cat $(pwd)/unity.log


echo 'Attempting to zip builds'
echo pwd
zip -r $(pwd)/asdf/Build/linux.zip $(pwd)/asdf/Build/linux/
zip -r $(pwd)/asdf/Build/mac.zip $(pwd)/asdf/Build/osx/
zip -r $(pwd)/asdf/Build/windows.zip $(pwd)/asdf/Build/windows/
