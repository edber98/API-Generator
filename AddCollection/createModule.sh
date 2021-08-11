#!/bin/bash

if [  -z  "$1"  ]
then
        echo "Il manque le singulier du module"
        exit
elif [ -z  "$2" ]
then
        echo "Il manque le pluriel du module"
        exit
elif [ -z  "$3" ]
then
        echo "Il manque le path ou mettre les modifications"
        exit
else
        echo "Ajout du module : $1"
fi

PP=$(realpath "$0")
PATHFILE=${PP%"$0"}
LIBFILE=$(echo $PP | sed  -e 's/'"createModule.sh"'$//')


PROJETPATH=${3:-"./"}

lowerSin=$(echo "$1" | tr '[:upper:]' '[:lower:]')
upperSin=$(echo "${1^}" )

lowerPlu=$(echo "$2" | tr '[:upper:]' '[:lower:]')
upperPlu=$(echo "${2^}" )


"${LIBFILE}createModuleSchema.sh" $lowerSin $upperSin $lowerPlu $upperPlu > ${PROJETPATH}/schemas/${upperSin}.js

TEXTREPONSE=$("${LIBFILE}createModuleTextResponse.sh" $lowerSin $upperSin $lowerPlu $upperPlu)


node -e "let pkg=require('./text-reponse.js'); var re = {${TEXTREPONSE//$'\n'/}} ;  var edit = Object.assign(pkg, re); require('fs').writeFileSync('text-reponse.js', 'module.exports = '+JSON.stringify(pkg, null, 2));"

"${LIBFILE}createModuleConstructor.sh" $lowerSin $upperSin $lowerPlu $upperPlu  > ${PROJETPATH}/constructors/${upperSin}Constructor.js

"${LIBFILE}createModuleService.sh" $lowerSin $upperSin $lowerPlu $upperPlu > ${PROJETPATH}/services/${upperSin}Service.js

"${LIBFILE}createModuleController.sh" $lowerSin $upperSin $lowerPlu $upperPlu  > ${PROJETPATH}/controllers/${upperSin}Controller.js


CONTROLLERDECLA=$("${LIBFILE}createModuleControllerDeclaration.sh" $lowerSin $upperSin $lowerPlu $upperPlu)

CONTROLLEROAD=$("${LIBFILE}createModuleControllerRouting.sh" $lowerSin $upperSin $lowerPlu $upperPlu)

CONTROLLEROAD=$(echo "$CONTROLLEROAD" | tr '\n' "~" )
echo "$CONTROLLEROAD" | tail -n +$((x+1))


node -e "var fs =  require('fs'); var res = fs.readFileSync('server.js', 'utf8'); console.log(res.search('EP_R_END'));var index = res.search('EP_R_END');
        var indexToPlace = -1
        for (var i = index; i != 0; i--) {
                if (res[i] =='\n') {
                        var ecart = 0
                        for (var j = i; res[j] =='\n'; j--) {
                                ecart++;
                        }
                        indexToPlace = Math.trunc(i - (ecart/2))
                        console.log(indexToPlace)
                        break ;
                }
        }
        var text = String(\"$CONTROLLEROAD\").replace(/~/g, '\n')
        console.log(text)
        if (indexToPlace > -1)
               var output = [res.slice(0, indexToPlace), text, res.slice(indexToPlace)].join('');
        console.log(output)

 fs.writeFileSync('server.js', output);"



CONTROLLERDECLA=$(echo "$CONTROLLERDECLA" | tr '\n' "~" )
echo "$CONTROLLERDECLA" | tail -n +$((x+1))

echo "$CONTROLLERDECLA" 

node -e "var fs =  require('fs'); var res = fs.readFileSync('server.js', 'utf8'); console.log(res.search('EP_RIMPORT_END'));var index = res.search('EP_RIMPORT_END');
        var indexToPlace = -1
        for (var i = index; i != 0; i--) {
                if (res[i] =='\n') {
                        var ecart = 0
                        for (var j = i; res[j] =='\n'; j--) {
                                ecart++;
                        }
                        indexToPlace = Math.trunc(i - (ecart/2))
                        console.log(indexToPlace)
                        break ;
                }
        }
        var text = String(\"$CONTROLLERDECLA\").replace(/~/g, '\n')
        console.log(text)
        if (indexToPlace > -1)
               var output = [res.slice(0, indexToPlace), text, res.slice(indexToPlace)].join('');
        console.log(output)

 fs.writeFileSync('server.js', output);"
