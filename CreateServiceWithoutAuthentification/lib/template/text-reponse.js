module.exports =  {
    express: 'Le module express a pu correctement ouvrir le port.',
    mongodb: {
        not_init: 'La connection est pas encore initialisé.',
        open: 'Connexion ouverte au serveur mongo.',
        connect: 'Connexion connectée au serveur mongo.',
        disconnect: 'Serveur mongo déconnectée.',
        error_disconnect: 'Serveur mongo erreur ... déconnecter.',
        connection: 'Connexion en cours au serveur mongo.',
        close : 'Connexion au serveur mongo est éteinte.',
        error: 'Serveur mongo erreur de connexion.',
        reconnected: 'Serveur mongo reconnecter.',
        reconnection: 'Serveur mongo reconnecter en cours.',
        bad_format: 'Mauvais format dans la requête.',
        not_found: `Le document cherché n'a pas été trouvé.`,
        not_found_many: `Les documents recherchés n'ont pas été trouvés.`,
        error_query: 'Mauvais format dans la requête (Erreur serveur mongod).',
        internal: 'Une erreur dans le système.',
        not_unique: 'Certains elements ne sont pas uniques.',
        is_used: 'est déja utilisé.'
    },
    authorization: {
        impossible: `Impossible de determiner les droits attribués.`,
        not_permission: `Vous ne disposez pas de la permission nécessaire.`
    },
    response: {
        internal: 'Une erreur est survenue.',
        unauthorized: "Vous ne disposez pas des droits necessaires.",
        body_empty: 'Body manquant.',
        invalid_params: `Problème de 'parameters' dans l'url.`,
        invalid_id: 'Les Id utilisés ne sont pas valide.',
        invalid_query: `Il manque certain element 'query' necessaire pour faire aboutir cet requete.`,
        bad_query: "Erreur de format du parametres 'query'.",
        error_query: `Problème de 'query' dans la requète.`,
        result_to_bad_query: "impossible mauvais format query",
        champs_vide: 'Champs vides.',
        bad_fields: "Erreur du champs.",
        bad_body: 'Erreur champ body.'
    },
    authentification: {
        tentative_connect: "Tentative d'authentification.",
        impossible_connect: "Impossible d'authentification.",
        success_connect:"Authentification réussi.",
        tentative_disconnect: "Tentative d'authentification.",
        impossible_disconnect: "Impossible de déconnecté l'utilisateur.",
        success_disconnect: "Déconnection de l'utilisateur."
    },
    success: 'réussi',
    fail: 'a échoué',
    
    // -- //---EP_TEXT_REPONSE_END // -- TEXT REPONSE END -- //     NE PAS EFFACER
}
