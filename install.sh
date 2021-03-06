#! /bin/sh

New_URL=https://download.unity3d.com/download_unity/3071d1717b71/MacEditorInstaller/Unity-2018.2.5f1.pkg
BASE_URL=https://netstorage.unity3d.com/unity
HASH=3071d1717b71
VERSION=2018.2.5f1

download() {
  file=$1
  url="$BASE_URL/$HASH/$package"

  echo "Downloading from $url: "
  cd $(pwd)
  curl -o `basename "$package"` "$url"
}

install() {
  package=$1
  download "$package"

  echo "Installing "`basename "$package"`
  sudo installer -pkg `basename "$package"` -target /
}

# See $BASE_URL/$HASH/unity-$VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`

install "MacEditorInstaller/Unity-$VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-$VERSION.pkg"
#install "MacEditorTargetInstaller/UnitySetup-Mac-Support-for-Editor-$VERSION.pkg"
install "MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-$VERSION.pkg"
