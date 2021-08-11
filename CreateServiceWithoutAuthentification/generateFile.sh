#! /bin/sh

PP=$(realpath "$0")
PATHFILE=${PP%"$0"}
LIBFILE=$(echo $PP | sed  -e 's/'"generateFile.sh"'$//')


if [ -d "services" ]; then
    mv services services_old
fi
mkdir services

cd services

npm init -y > /dev/null

node -e "let pkg=require('./package.json'); pkg.main='server.js'; require('fs').writeFileSync('package.json', JSON.stringify(pkg, null, 2));"

npm install --save express body-parser cors winston


TEMPLATELINK="${LIBFILE}/lib/template/"

cp -r "$TEMPLATELINK"* ./ 

#./../AddCollection/createModule.sh user users .

#parametres : NOM DE LA COLLECTION - PORT