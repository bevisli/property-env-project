#!/bin/bash
set -e

echo "`date` sync code"
cd /opt/build/depot/asamxpress
git fetch origin -p
git pull

echo "`date` sync env"
cd /opt/build/depot/asamxpress-env-project
git fetch origin -p
git pull

#echo "`date` copy properties"
#cp -r /opt/build/depot/asamxpress-env-project/qa/conf/asamxpress/* /opt/build/depot/asamxpress/

echo "`date` build tar"
cd /opt/build/depot/asamxpress
./gradlew -Penv=prod clean build

echo "`date` copy tar files to build packages"
cd /opt/build/depot/asamxpress
cp build/asamxpress-service/distributions/asamxpress-service.tar /opt/app-packages/asamxpress-service.tar