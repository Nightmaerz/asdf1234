#! /bin/sh

BASE_URL=https://netstorage.unity3d.com/unity
HASH=88d00a7498cd
VERSION=2018.2.7f1

download() {
  file=$1
  url="https://beta.unity3d.com/download/dad990bf2728/UnitySetup-2018.2.7f1"

  echo "Downloading from $url: "
  curl -o `basename "$package"` "$url"
}

install() {
  package=$1
  download "$package"

  echo "Installing "`basename "$package"`
  chmod +x UnitySetup-2018.2.7f1
  ./UnitySetup-2018.2.7f1 #`basename "$package"` -target /
}

# See $BASE_URL/$HASH/unity-$VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`

install "UnitySetup-2018.2.7f1"
