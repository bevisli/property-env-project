#!/bin/bash
set -e

cd /opt/build/depot/back-office

echo "`date` db migration"
./gradlew -Penv=prod :back-office-db-migration:flywayMigrate

echo "`date` sync env"
cd /opt/build/depot/property-env-project
git fetch origin -p
git pull

echo "`date` deploy apps"
ansible-playbook /opt/build/depot/property-env-project/qa/10-deploy.yml