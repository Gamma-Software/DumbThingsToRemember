# Configure your paths and filenames
SOURCEBINPATH=/usr/bin
SOURCEBIN=add_dumb_things.sh
DEBFOLDER=dumb-things
DEBVERSION=1.0
DEBEMAIL="valentin.rudloff.perso@gmail.com"
DEBFULLNAME="Valentin RUDLOFF"
REVISION=1
ARCHITECTURE=all

DEBFOLDERNAME=${DEBFOLDER}_${DEBVERSION}-${REVISION}_${ARCHITECTURE}

# Create your scripts source dir
rm -rf $DEBFOLDERNAME # Make sure it's clean
mkdir $DEBFOLDERNAME

# Copy your script to the user bin dir
mkdir -p $DEBFOLDERNAME/$SOURCEBINPATH
cp ../$SOURCEBIN $DEBFOLDERNAME/$SOURCEBINPATH

# Copy DEBIAN folder
cp -r DEBIAN $DEBFOLDERNAME

# Update version in control file
sed -i "s/{VERSION}/$DEBVERSION/g" $DEBFOLDERNAME/DEBIAN/control

# Copy changelog
cp ../CHANGELOG.md $DEBFOLDERNAME/DEBIAN/changelog

# Build deb package
dpkg-deb --build --root-owner-group $DEBFOLDERNAME

# Remove build folder
rm -rf $DEBFOLDERNAME