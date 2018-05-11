#!/bin/bash
set -e

echo "`date` sync code"
cd /opt/build/depot/property
git fetch origin -p
git pull

echo "`date` sync env"
cd /opt/build/depot/property-env-project
git fetch origin -p
git pull

#echo "`date` copy properties"
#cp -r /opt/build/depot/property-env-project/qa/conf/property/* /opt/build/depot/property/

echo "`date` build tar"
cd /opt/build/depot/property
./gradlew -Penv=qa clean build

echo "`date` copy tar files to build packages"
cd /opt/build/depot/property
cp build/back-office/distributions/back-office.tar /opt/app-packages/back-office.tar