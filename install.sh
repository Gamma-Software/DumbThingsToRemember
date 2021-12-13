#!/bin/bash

# return error if script is not run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Installing add_dumb_things script..."
echo "Copying add_dumb_things script to /usr/bin..."

# return error if script already exists
if [ -f /usr/bin/add_dumb_things ]; then
   echo "add_dumb_things script already exists" 1>&2
   exit 1
else
    cp add_dumb_things.sh /usr/bin/add_dumb_things
fi