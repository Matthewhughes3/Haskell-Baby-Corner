-- TODO: Figure out how to type these functions
isSucc subject successor = succ subject == successor

whatIThinkAboutYou subject successor = if isSucc subject successor then "You Suck!" else "You're Cool"