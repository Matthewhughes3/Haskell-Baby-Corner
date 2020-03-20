-- TODO: Figure out how to type these functions
-- TODO: Review best practices to see if a function like this should even be explicitly typed
isSucc subject successor = succ subject == successor

whatIThinkAboutYou subject successor = if isSucc subject successor then "You Suck!" else "You're Cool"