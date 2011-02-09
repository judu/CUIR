/*------------------------------
 * CtxServices
 * Author: Julien Durillon
 * Creation date: mer. févr. 9 2011
 ------------------------------*/
MACHINE
  CtxServices
  
SETS
  TYPE = {libre,contraint}
  ; ACCES = {excl, incl}
  ; ETAT = {actif, inactif}
  ; PROFILES = {p1, p2, p3}
  
CONSTANTS
  SERVICES
  , PROCESSUS
  
PROPERTIES
  SERVICES = NAT
  & PROCESSUS = NAT

END
