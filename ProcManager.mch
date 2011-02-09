/*------------------------------
 * ProcManager
 * Author: Julien Durillon
 * Creation date: mer. févr. 9 2011
 ------------------------------*/
MACHINE
  ProcManager
  
INCLUDES
  CtxServices
  
VARIABLES
  processes
  , proc_profile

  
INVARIANT
  processes <: PROCESSUS
  & proc_profile = processes --> PROFILES
  
INITIALISATION
  processes := {} || proc_profile := {}
  

END
