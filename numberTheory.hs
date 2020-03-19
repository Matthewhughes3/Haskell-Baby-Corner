myFavoriteNumbers = [2098, 98, 2019874, 4]

myBrothersFavoriteNumbers = [2, 1, 4, 9]

mineAndMyBrothersFavoriteNumbers = myFavoriteNumbers ++ myBrothersFavoriteNumbers

howSmartIAm = "Pretty smart"

howSmartMyBrotherIs = "Not as smart as me"

howSmartMeAndMyBrotherAre = howSmartIAm ++ " " ++ howSmartMyBrotherIs

mineAndMyBrothersFavoriteNumbersWithFiveAtTheBeginning = 5:mineAndMyBrothersFavoriteNumbers

-- TODO: figure out how to explicitly type favoriteNumbers as a list of ints
someOnesSecondFavoriteNumber favoriteNumbers = favoriteNumbers !! 1

-- TODO: figure out how to explicitly type numberThatIsQuitePossiblyBetweenOneAndTwentyButNotDefinitely as an int
isBetweenOneAndTwenty numberThatIsQuitePossiblyBetweenOneAndTwentyButNotDefinitely = numberThatIsQuitePossiblyBetweenOneAndTwentyButNotDefinitely `elem` [1..20]

-- TODO: get a wider monitor
evenNumbersInBetween numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers myFingersHurt = if numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers `mod` 2 == 0 then [numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers, numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers + 2..myFingersHurt] else [numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers + 1, numberThatYouWouldLikeToUseToBeginYourConquestOfEvenNumbers + 3..myFingersHurt]