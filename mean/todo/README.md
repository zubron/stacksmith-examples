# Package and deploy with Stacksmith

1. Go to [stacksmith.bitnami.com](https://stacksmith.bitnami.com)
2. Create a new application and select the MEAN/MERN stack template
3. Select the targets you are insterested on (AWS,Kubernets,...)
4. Compress the _app/_ folder from this repo and upload it as application files:

   ```bash
   $ git clone https://github.com/bitnami/stacksmith-examples
   cd stacksmith-examples/mean/todo
   tar czf app.tar.gz app
   ```

5. Upload the [_build.sh_](scripts/build.sh), [_boot.sh_](scripts/boot.sh) and [_run.sh_](scripts/run.sh) scripts from the [_scripts/_](scripts/) folder.
6. Click the `Create` button

## Scripts

In the scripts folder, you can find the required scripts to build and run this application:

### build.sh

This script takes care of installing the application. It performs the next steps:

* Adds the system user that will run the application
* Uncompress the application code to the `/opt/app` folder
* Adjust the application files permissions

### boot.sh

This script takes care of configure the application as well as install the dependencies.

### run.sh

This script just starts the application with the proper user.
