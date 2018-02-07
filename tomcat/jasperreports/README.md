# Tomcat + PostgreSQL: JasperReports Server

This is a real Tomcat application to show how to deploy a Tomcat+PostgreSQL application using [Bitnami Stacksmith](stacksmith.bitnami.com).

> The JasperReports Server can be used as a stand-alone or embedded reporting and BI server that offers web-based reporting, analytic tools and visualization, and a dashboard feature for compiling multiple custom views.

For more information, please visit https://community.jaspersoft.com/.

## Package and deploy with Stacksmith

1. Go to [stacksmith.bitnami.com](https://stacksmith.bitnami.com)
2. Create a new application and select the Tomcat application with PostgreSQL stack template
3. Select the targets you are insterested on (AWS,Kubernetes,...)
4. Download the JasperReports bundle from the official site: [JasperReports Server releases](https://community.jaspersoft.com/project/jasperreports-server/releases) (i.e. [TIB_js-jrs-cp_6.4.2_bin.zip](https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20Edition%206.4.2/TIB_js-jrs-cp_6.4.2_bin.zip/download)) and upload it as application file.

5. Upload the [_build.sh_](build.sh) and [_boot.sh_](boot.sh) scripts.
6. Click the <kbd>Create</kbd> button

## Scripts

There are two required scripts to build and run this application:

### build.sh

This script takes care of extracting the application. It performs the next steps:

* Install required extra system packages
* Uncompress the uploaded bundle
* Prepare the configuration file `default_master.properties`
* Deploy the webapp (_.war_ file) in the tomcat directory

### boot.sh

This script takes care of initializing the database and configuring the application: Basically, it does:

* Update the Tomcat datasource with the actual values of the database connection
* Initialize and populate the database
* (Optional) Import fictitious sample data
* Restart Tomcat to reload the new webapp