#! /bin/bash


PP=$(realpath "$0")
PATHFILE=${PP%"$0"}
LIBFILE=$(echo $PP | sed  -e 's/'"activate_alias.sh"'$//')

echo "sh ${LIBFILE}CreateServiceWithoutAuthentification/generateFile.sh"

alias rdAddCollection='sh "${LIBFILE}AddCollection/createModuleSchema.sh"'
alias rdnewService="sh ${LIBFILE}CreateServiceWithoutAuthentification/generateFile.sh"

alias agu='sudo apt-get update'
