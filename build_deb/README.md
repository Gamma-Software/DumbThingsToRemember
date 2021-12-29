# Generate Debian package

The generation of the debian package is done with a Docker container based on ubuntu 18.04 image.
This docker image is coded to work on the project [DumbThingToRemember](https://github.com/Gamma-Software/DumbThingsToRemember).

## Scripts

### Build

The Docker image will generate the debian package with the script `build_deb.sh`

### Verify

The Docker image will then verify the debian package with the script `verify_deb.sh`

## Build Docker image

### Build the image

To build the Docker image, run the following command:
`docker build -t <container_image_name> build_deb/`
Where `<container_image_name>` is the name of the container image.

### Run the container

To build and verify the debian package, you must run the following command from the root of the repository:
`docker run -v '$PWD:/build' <container_images_name> -name <container_name>`
Where `<container_name>` is the temporary name of the container.