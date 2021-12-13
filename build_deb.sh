# Configure your paths and filenames
SOURCEBINPATH=$(pwd)
SOURCEBIN=add_dumb_things.sh
DEBFOLDER=dumb-things
DEBVERSION=1.0
DEBEMAIL="valentin.rudloff.perso@gmail.com"
DEBFULLNAME="Valentin RUDLOFF"

DEBFOLDERNAME=$DEBFOLDER-$DEBVERSION

# Create your scripts source dir
mkdir $DEBFOLDERNAME

# Copy your script to the source dir
cp $SOURCEBINPATH/$SOURCEBIN $DEBFOLDERNAME 
cd $DEBFOLDERNAME

# Create the packaging skeleton (debian/*)
dh_make -s --indep --createorig 

# add script
echo "$SOURCEBIN usr/bin" >> debian/install

# Build the package.
# You  will get a lot of warnings and ../somescripts_0.1-1_i386.deb
debuild -us -uc
