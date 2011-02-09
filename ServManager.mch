/*------------------------------
 * ServManager
 * Author: Julien Durillon, Alexandre Garnier
 * Creation date: mer. févr. 9 2011
 ------------------------------*/
MACHINE
  ServManager
  
INCLUDES
  CtxServices
  
VARIABLES
  services /* Les services actuellement disponibles */
  , type_service /* Un service possède un type : soit libre, soit contraint */
  , serv_libre /* Ensemble des services libres */
  , serv_contraint /* Ensemble des services contraints */
  , acces_service /* Un service est soit exclusif soit inclusif */
  , serv_actif /* Les services qui sont actuellement appelables */
  
INVARIANT
  	services <: SERVICES
  & type_service : services --> TYPE
  & serv_libre <: services
  & serv_libre = type_service~[{libre}]
  & serv_contraint <: services
  & serv_contraint = type_service~[{contraint}]
  & acces_service : services --> ACCES
  & serv_actif : services +-> ETAT
 
INITIALISATION
  type_service := {} || serv_libre := {} || serv_contraint := {} || acces_service := {} || services := {} || serv_actif := {}
  
OPERATIONS
  addService (serv, tt, ac) = /* Ajoute un service ainsi que sa contrainte et son type d'accès */
  PRE
    serv : SERVICES
    & serv /: services
    & tt : TYPE
    & ac : ACCES
  THEN
    services := services \/ {serv} || type_service := type_service \/ {(serv |-> tt)} || acces_service := acces_service \/ {(serv |-> ac)}
  END
  ;
  
  startService(serv) =
  PRE
    serv : SERVICES
    & serv : services
  THEN
    serv_actif := serv_actif \/ {serv |-> actif}
  END
  ;
  
  stopService(serv) =
  PRE
    serv : SERVICES
    & serv : services
    & serv : dom(serv_actif)
  THEN
    serv_actif := {serv} <<| serv_actif
  END
  ;
  
  subscribeTo(proc,serv) =
  PRE
    proc : PROCESSUS
    & serv : SERVICES
  THEN
    skip /* TODO: write this.*/
  END
END