myFavoriteNumbers = [2098, 98, 2019874, 4]

myBrothersFavoriteNumbers = [2, 1, 4, 9]

mineAndMyBrothersFavoriteNumbers = myFavoriteNumbers ++ myBrothersFavoriteNumbers

howSmartIAm = "Pretty smart"

howSmartMyBrotherIs = "Not as smart as me"

howSmartMeAndMyBrotherAre = howSmartIAm ++ " " ++ howSmartMyBrotherIs

mineAndMyBrothersFavoriteNumbersWithFiveAtTheBeginning = 5:mineAndMyBrothersFavoriteNumbers

someOnesSecondFavoriteNumber :: [Integer] -> Integer
someOnesSecondFavoriteNumber favoriteNumbers = favoriteNumbers !! 1

isBetweenOneAndTwenty :: Int -> Bool
isBetweenOneAndTwenty numberThatIsQuitePossiblyBetweenOneAndTwentyButNotDefinitely = numberThatIsQuitePossiblyBetweenOneAndTwentyButNotDefinitely `elem` [1..20]

evenNumbersInBetween :: Int -> Int -> [Int]
evenNumbersInBetween numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers myFingersHurt = if numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers `mod` 2 == 0 then [numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers, numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers + 2..myFingersHurt] else [numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers + 1, numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers + 3..myFingersHurt]

getMultiples :: Int -> Int -> [Int]
getMultiples multiplier numberOfMultiples = take numberOfMultiples [multiplier, multiplier + multiplier..]

evenNumbersInBetween2 :: Int -> Int -> [Int]
evenNumbersInBetween2 startNumber endNumber = [x | x <- [startNumber..endNumber], even x]