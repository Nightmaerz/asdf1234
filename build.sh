#! /bin/sh


echo "Attempting to build asdf1234 for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath="$(pwd)/asdf1234" \
  -buildWindowsPlayer "Build/windows/asdf1234.exe" \
  -quit

#echo "Attempting to build $project for OS X"
#/Applications/Unity/Unity.app/Contents/MacOS/Unity \
#  -batchmode \
#  -nographics \
#  -silent-crashes \
#  -logFile $(pwd)/unity.log \
#  -projectPath=$(pwd)/asdf \
#  -buildOSXUniversalPlayer "$(pwd)/asdf/Build/osx/$project.app" \
#  -quit

echo "Attempting to build $project for Linux"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unity.log \
  -projectPath="$(pwd)/asdf1234" \
  -buildLinuxUniversalPlayer "$(pwd)/asdf/Build/linux/$project.exe" \
  -quit

echo 'Logs from build'
cat $(pwd)/unity.log


echo 'Attempting to zip builds'
echo $(pwd)
zip -r $(pwd)/asdf/Build/linux.zip $(pwd)/asdf/Build/linux/
#zip -r $(pwd)/asdf/Build/mac.zip $(pwd)/asdf/Build/osx/
zip -r $(pwd)/Build/windows.zip $(pwd)/Build/windows/
