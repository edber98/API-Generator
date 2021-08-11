lowerSin=$1
upperSin=$2

lowerPlu=$3
upperPlu=$4

echo "

/*****************************/
/*      ${lowerSin^^}        */
/*****************************/

//ONE
//AJOUTER ${lowerSin^^}
app.post('/${lowerSin}', DatabaseMiddleware.checkDatabase,  CheckerMiddleware.checkIsBody, ${upperSin}Controller.createOne${upperSin})

//GET ${lowerSin^^}
app.get('/${lowerSin}/id/:_id', DatabaseMiddleware.checkDatabase, CheckerMiddleware.checkIsParamsIsObjectId('_id'),  ${upperSin}Controller.findOneById)
//MODIFIER ${lowerSin^^}
app.put('/${lowerSin}/id/:_id', DatabaseMiddleware.checkDatabase, CheckerMiddleware.checkIsParamsIsObjectId('_id'),  ${upperSin}Controller.findOneByIdAndUpdate)
//SUPRIMER UN ${lowerSin^^}
app.delete('/${lowerSin}/id/:_id', DatabaseMiddleware.checkDatabase, CheckerMiddleware.checkIsParamsIsObjectId('_id'), ${upperSin}Controller.deleteOne${upperSin})


//MANY
app.get('/${lowerPlu}', DatabaseMiddleware.checkDatabase,  ${upperSin}Controller.findMany${upperSin})
//SUPPRIMER MULTIPLE ${lowerSin^^}
app.delete('/${lowerPlu}', DatabaseMiddleware.checkDatabase, CheckerMiddleware.checkIsQuery('_id'), ${upperSin}Controller.deleteMany${upperPlu})"