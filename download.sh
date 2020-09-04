#!/bin/bash

curl_options="--retry 5 --location --progress-bar"
curl_options_silent="--retry 5 --location --silent"

# download latest release from github
function download_github()
# $1 is sub URL of release page
# $2 is partial file name to look for
# $3 is file name to rename to
{
    echo "downloading `basename $3 .zip`:"
    curl $curl_options_silent --output /tmp/com.hieplpvip.download.txt "https://github.com/$1"
    local url=https://github.com`grep -o -m 1 "/.*$2.*\.zip" /tmp/com.hieplpvip.download.txt`
    echo $url
    curl $curl_options --output "$3" "$url"
    rm /tmp/com.hieplpvip.download.txt
    echo
}

rm -rf download && mkdir ./download
cd ./download

# download kexts
mkdir ./zips && cd ./zips
download_github "acidanthera/Lilu/releases" "RELEASE" "acidanthera-Lilu.zip"
download_github "acidanthera/AppleALC/releases" "RELEASE" "acidanthera-AppleALC.zip"
download_github "acidanthera/HibernationFixup/releases" "RELEASE" "acidanthera-HibernationFixup.zip"
download_github "acidanthera/VirtualSMC/releases" "RELEASE" "acidanthera-VirtualSMC.zip"
download_github "acidanthera/VoodooPS2/releases" "RELEASE" "acidanthera-VoodooPS2.zip"
download_github "acidanthera/WhateverGreen/releases" "RELEASE" "acidanthera-WhateverGreen.zip"
download_github "lvs1974/CpuTscSync/releases" "RELEASE" "lvs1974-CpuTscSync.zip"
download_github "PMheart/LiluFriend/releases" "RELEASE" "PMheart-LiluFriend.zip"

cd ..

KEXTS="AppleALC|WhateverGreen|Lilu|VirtualSMC|SMCBatteryManager|SMCProcessor|VoodooPS2Controller|CpuTscSync|Fixup"

function check_directory
{
    for x in $1; do
        if [ -e "$x" ]; then
            return 1
        else
            return 0
        fi
    done
}

function unzip_kext
{
    out=${1/.zip/}
    rm -Rf $out/* && unzip -q -d $out $1
    check_directory $out/Release/*.kext
    if [ $? -ne 0 ]; then
        for kext in $out/Release/*.kext; do
            kextname="`basename $kext`"
            if [[ "`echo $kextname | grep -E $KEXTS`" != "" ]]; then
                cp -R $kext ../kexts
            fi
        done
    fi
    check_directory $out/*.kext
    if [ $? -ne 0 ]; then
        for kext in $out/*.kext; do
            kextname="`basename $kext`"
            if [[ "`echo $kextname | grep -E $KEXTS`" != "" ]]; then
                cp -R $kext ../kexts
            fi
        done
    fi
    check_directory $out/Kexts/*.kext
    if [ $? -ne 0 ]; then
        for kext in $out/Kexts/*.kext; do
            kextname="`basename $kext`"
            if [[ "`echo $kextname | grep -E $KEXTS`" != "" ]]; then
                cp -R $kext ../kexts
            fi
        done
    fi
}

mkdir ./kexts

check_directory ./zips/*.zip
if [ $? -ne 0 ]; then
    echo Unzipping...
    cd ./zips
    for kext in *.zip; do
        unzip_kext $kext
    done

    cd ..

    for thefile in $( find kexts \( -type f -name Info.plist -not -path '*/Lilu.kext/*' -not -path '*/LiluFriend.kext/*' -print0 \) | xargs -0 grep -l '<key>as.vit9696.Lilu</key>' ); do
        name="`/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' $thefile`"
        version="`/usr/libexec/PlistBuddy -c 'Print :OSBundleCompatibleVersion' $thefile`"
        if [[ -z "${version}" ]]; then
            version="`/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' $thefile`"
        fi
        /usr/libexec/PlistBuddy -c "Add :OSBundleLibraries:$name string $version" kexts/LiluFriend.kext/Contents/Info.plist
    done
fi

cd ..
