#!/bin/bash

# Change dir to the script location
cd build_deb
. ./common # import common variables and functions

# Check that the deb package correctly created
if [ $DEBFOLDERNAME.deb ]; then
    success_msg "1/6 The deb package has been created -> OK"
else
    error_exit "1/6 Deb package not created -> FAIL" 1
fi

# Install the deb package
dpkg -i $DEBFOLDERNAME.deb
if [ $? -eq 0 ]; then
    success_msg "2/6 The deb package has been installed -> OK"
else
    error_exit "2/6 Deb package not installed -> FAIL" 2
fi

# Verify that the script has been correctly installed
if [ -f $SOURCEBINPATH/${SOURCEBIN} ]; then
    success_msg "3/6 The script has been installed -> OK"
else
    error_exit "3/6 Script not installed -> FAIL" 3
fi

# Make sure the deb package is correctly installed
dpkg -l | grep -q $PCK_NAME
if [ $? -eq 0 ] ; then
    success_msg "4/6 The deb package is installed -> OK"
else
    error_exit "4/6 The deb package is not installed -> FAIL" 4
fi

# Remove the deb package
dpkg -P $PCK_NAME
if [ $? -eq 0 ]; then
    success_msg "5/6 The deb package has been uninstalled -> OK"
else
    error_exit "5/6 Deb package not uninstalled -> FAIL" 5
fi

# Make sure the deb package is removed
dpkg -l | grep -q $PCK_NAME
if [ $? -eq 1 ] ; then
    success_msg "6/6 The deb package is removed after uninstallation-> OK"
else
    error_exit "6/6 The deb package is not removed after uninstallation-> FAIL" 6
fi