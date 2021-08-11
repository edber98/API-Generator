  
  lowerSin=$1
upperSin=$2

lowerPlu=$3
upperPlu=$4


   echo " ${lowerSin}: {
        domain:'Le domaine est requis.',
        not_found: '${upperSin} inexistant.',
        add: 'Ajout de',
        add_${lowerSin}: \`Ajout d'un ${lowerSin}.\`,
        cant_add_${lowerSin}: \`Impossible d'ajouter un ${lowerSin}.\`,
        tentative_get_${lowerSin}: \`Tentative de récupération d'un ${lowerSin}\`,
        tentative_get_${lowerSin}_multiple: \`Tentative de récupération des ${lowerPlu}\`,
        tentative_get_${lowerSin}_multiple_fail: \`Echec de la tentative de récupération des ${lowerPlu}\`,
        tentative_edit: \`Tentative d'edition d'un ${lowerSin}\`,
        tentative_delete_one: \`Tentative de suppression d'un ${lowerSin}\`,
        tentative_delete_fail: \`Echec de la tentative de suppression d'un ${lowerSin}\`,
        tentative_delete_multiple: \`Tentative de suppression des ${lowerPlu}\`,
        tentative_delete_multiple_fail: \`Echec de la tentative de suppression des ${lowerPlu}\`,
        tentative_get_fields_common: \`Tentative de récupération des elements en commun\`,
        tentative_get_fields_common_fail: \`Echec de la tentative de récupération des elements en commun\`,
        tentative_add_${lowerPlu}_to_permissions: \`Tentative d'ajoût de permission a des ${lowerPlu}\`,
        tentative_add_${lowerPlu}_to_permissions_fail: \`Echec de la tentative d'ajoût permission a des ${lowerPlu}\`,
        tentative_delete_${lowerPlu}_to_permissions: \`Tentative de suppression de permission a des ${lowerPlu}\`,
        tentative_delete_${lowerPlu}_to_permissions_fail: \`Echec de la tentative de suppression permission a des ${lowerPlu}\`
    } "