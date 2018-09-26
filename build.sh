#! /bin/sh


echo "Attempting to build asdf1234 for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unitywindows.log \
  -projectPath="$(pwd)" \
  -buildWindowsPlayer \
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

echo "Attempting to build asdf1234 for Linux"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unitylinux.log \
  -projectPath="$(pwd)" \
  -buildLinuxUniversalPlayer "linux/$project.exe" \
  -quit

echo 'Logs from build'
cat $(pwd)/unitylinux.log
cat $(pwd)/unitywindows.log


echo 'Attempting to zip builds'
echo $(pwd)
zip -r $(pwd)/asdf/Build/linux.zip $(pwd)/linux
#zip -r $(pwd)/asdf/Build/mac.zip $(pwd)/asdf/Build/osx/
zip -r $(pwd)/Build/windows.zip $(pwd)/windows
