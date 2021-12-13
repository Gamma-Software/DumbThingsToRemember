#!/bin/bash

# return error if script is not run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Uninstalling add_dumb_things script..."
echo "Removing add_dumb_things script from /usr/bin..."

# return eror if add_dumb_things script is not installed
if [ ! -f /usr/bin/add_dumb_things ]; then
   echo "add_dumb_things script is not installed" 1>&2
   exit 1
else
    rm /usr/bin/add_dumb_things
fi