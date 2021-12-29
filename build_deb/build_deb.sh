#!/bin/bash
echo -e "Version to build: $1"

# Change dir to the script location
cd build_deb
. ./common # import common variables and functions

# Name of the deb package to build
DEBFOLDERNAME=${PCK_NAME}_${1}-${REVISION}_${ARCHITECTURE}

# Make sure the deb package is removed
rm -rf $DEBFOLDERNAME

# Create your scripts source dir
rm -rf $DEBFOLDERNAME # Make sure it's clean
mkdir $DEBFOLDERNAME

# Copy your script to the user bin dir
mkdir -p $DEBFOLDERNAME/$SOURCEBINPATH
cp ../$SOURCEBIN $DEBFOLDERNAME/$SOURCEBINPATH

# Copy DEBIAN folder
cp -r DEBIAN $DEBFOLDERNAME

# Update version and pck name in control file
sed -i "s/{VERSION}/${1}/g" $DEBFOLDERNAME/DEBIAN/control
sed -i "s/{PCK_NAME}/$PCK_NAME/g" $DEBFOLDERNAME/DEBIAN/control

# Copy changelog
cp ../CHANGELOG.md $DEBFOLDERNAME/DEBIAN/changelog

# Build deb package
dpkg-deb --build --root-owner-group $DEBFOLDERNAME

# Remove build folder
rm -rf $DEBFOLDERNAME