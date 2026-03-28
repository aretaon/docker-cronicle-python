# docker-cronicle-python

Docker project for Cronicle, bundling a python environment and script runner.

This is a modified version of https://github.com/flavsdotpy/docker-cronicle-python adapted to run with https://github.com/cronicle-edge/cronicle-edge v1.14.1+

## Create the container

When using podman create a container from the provided Dockerfile as follows

  podman build -t local/cronicle-python -f Dockerfile

Once this image is ready, mount local volumes and run as follows

  podman run --rm -it local/cronicle-python -volume scripts:/opt/cronicle/scripts/python -volume data:/opt/cronicle/data -volume logs:/opt/cronicle/logs -hostname cronicle-python-manager manager

Note that a persistent hostname is necessary as cronicle will assign the manager role based on regex matching to the hostname and rotating container names will prevent this.
Once the container is up, the webinterface can be reached by default at port 3012:

Default account and password:

- username: `admin`
- password: `admin`

## Adding a new Python script to run

* Copy your python script to `scripts` (see volume mount path above)
* Open [Cronicle console](localhost:3012)
* Go to `Schedule > [+] Add event...`
* Create the job as:
  * Plugin: `Python Script`.
  * Script path: the path to your script file, relative to `scripts/python` (i.e. `my_script.py` for `$HOME/.cronicle/scripts/python/my_script.py`).
  * Required packages (not required): the same content of your `requirements.txt` file, each package in a line (with `==<version>` if needed).
  * Environment variables (not required): environment variables, one per line, in the format of a .env file (i.e. `AWS_REGION=us-east-1`)
  * Parameters (not required): single string of script parameters (i.e. `--v -f file.txt`)

For all other configurations, please refer to [cronicle official docs](https://github.com/jhuckaby/Cronicle/blob/master/docs/WebUI.md).

## Acknowledgments

Thanks to [flavsdotpy](github.com/flavsdotpy) for writing the python plugin and setting up the initial repository.  

## Authors

* **[flavsdotpy](https://github.com/flavsdotpy)**
* **[aretaon](https://github.com/aretaon)**
