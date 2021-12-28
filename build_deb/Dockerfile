FROM ubuntu:18.04

# Make the copy and change dir
RUN mkdir -p /build
WORKDIR /build

# Update and retrive dpkg and dependencies
RUN apt update -y && apt install -y dpkg

# Create the package
CMD ./build_deb/build_deb.sh; ./build_deb/verify_deb.sh