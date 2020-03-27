import qualified Data.List as List

data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String
} deriving (Show)

guy = Person {
    firstName = "Guy",
    lastName = "Dude",
    age = 10,
    height = 6.5,
    phoneNumber = "1"
}

fullName :: Person -> String
fullName person = firstName person ++ " " ++ lastName person

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
    deriving(Eq, Ord, Show, Read, Bounded, Enum)

workDays = [Monday, Thursday, Wednesday, Saturday, Tuesday, Friday]
sortedWorkDays = List.sort workDays

weekDays = [Monday .. Friday]