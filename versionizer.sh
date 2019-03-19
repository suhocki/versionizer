#!/bin/bash
manualUrl=https://raw.githubusercontent.com/suhocki/versionizer/master/README.md
mergesInMasterFromDevelop=$(git shortlog origin/master --merges | grep ".*\/develop" | wc -l)
if [[ $1 = "--type" ]]
    then
        if [[ $2 = name ]]
            then
                mergesInMaster=$(git rev-list origin/master --merges --count)
                mergesInDevelop=$(git rev-list origin/develop --merges --count)
                if [[ ${mergesInDevelop} -gt ${mergesInMaster} ]]
                    then echo "v0.$mergesInMasterFromDevelop.$((mergesInDevelop - mergesInMaster))"
                    else echo "v0.$mergesInMasterFromDevelop"
                fi
        else if [[ $2 = code ]]
            then mergesInMasterFromDevelop=$(git shortlog origin/master --merges | grep ".*\/develop" | wc -l)
                if [[ ${mergesInMasterFromDevelop} -le 0 ]]
                    then mergesInMasterFromDevelop=1
                fi
            echo ${mergesInMasterFromDevelop}
        else curl ${manualUrl}
	    fi
        fi
    else curl ${manualUrl}
fi