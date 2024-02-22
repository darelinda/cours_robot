*** Settings ***
Library                         OperatingSystem
Documentation                   Suite de teste manipulant des fichiers
Test Setup                       Log     Debut de test
Suite Setup                      Log     Fin de test
Suite Teardown                   Log     Fin de la suite


*** Test Cases ***
Test creation de fichier
# [Teardown]s'execute à la fin du test et on a qu'un seul par test
    [Documentation]                  Suite de teste manipulant des fichiers
    [Setup]                     File Should Not Exist        test_fichier.txt                msg=Le fichier arait du etre créé
    [Teardown]                  Mon Teardown personnalisé
    Create File                 test_fichier.txt                Ceci est le contenu du fichier
    File Should Exist           test_fichier.txt                msg=Le fichier arait du etre créé
     ${contenu} =               Get File                        test_fichier.txt
     Should Be Equal            ${contenu}                      Ceci est le contenu du fichier
    # Fail                        Erreur inattendue
    # Remove File                 test_fichier.txt
    # ceci est un commentaire


Test Setup 1
    Log    test setup 1
Test Setup 2
    Log    test setup 2


*** Keywords ***
Mon Teardown personnalisé
        Remove File    test_fichier.txt
        Log             Fichier nettoyé