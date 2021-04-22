#! /bin/bash
set -e

npm run build

if [ $HOSTNAME = "maury.uberspace.de" ]
then
    cp -r build/images ~/cm3/
    cp -r build/static ~/cm3/
elif [ $HOSTNAME = "shoemaker.uberspace.de" ]
then
    cp -r build/images ~/cm3/
    cp -r build/static ~/cm3/
else
    echo "Unknown hostname. Skipping deployment of static files."
fi

supervisorctl restart aoe3cm2
