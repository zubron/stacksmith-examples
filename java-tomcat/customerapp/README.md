# Java Tomcat with DB (MySQL): customerapp

This is an example Spring Boot Tomcat webapp used in the Azure quickstart guide applications using [Bitnami Stacksmith](stacksmith.bitnami.com).

## Package and deploy with Stacksmith

See https://stacksmith.bitnami.com/support/quickstart-azure for more info.

## Scripts

There is a single boot script to initialize this application:

### customerapp-boot.sh

This script takes care of waiting for the database to be available and then initializing the app with the
database configuration.
