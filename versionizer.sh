#!/bin/bash
manualUrl=https://raw.githubusercontent.com/suhocki/versionizer/master/README.md
mergesInMasterFromDevelop=$(git shortlog origin/master --merges | grep ".*\/develop" | wc -l)
currentBranch=$(git branch | grep \* | cut -d ' ' -f2)
if [[ $1 = name ]]
then
    mergesInMaster=$(git rev-list origin/master --merges --count)
    mergesInDevelop=$(git rev-list origin/develop --merges --count)
    releaseVersion=${mergesInMasterFromDevelop}
    majorVersion=${mergesInMasterFromDevelop}
    minorVersion=0
    if [[ ${mergesInDevelop} -gt ${mergesInMaster} ]]
        then majorVersion=$((mergesInDevelop - mergesInMaster))
    fi
    if ! [[ "$currentBranch" =~ ^(master|develop)$ ]]
        then
            commitCountInCurrentBranch=$(git rev-list --count HEAD)
            commitCountInDevelopBranch=$(git rev-list --count origin/develop)
            minorVersion=$((commitCountInCurrentBranch - commitCountInDevelopBranch))
    fi
    echo "$releaseVersion.$majorVersion.$minorVersion"
else if [[ $1 = code ]]
then
    mergesInDevelop=$(git rev-list origin/develop --merges --count)
    code=${mergesInDevelop}
    if [[ ${mergesInDevelop} -le 0 ]]
        then code=1
    fi
    echo ${code}
else curl ${manualUrl}
fi
fi
