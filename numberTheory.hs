myFavoriteNumbers = [2098, 98, 2019874, 4]

myBrothersFavoriteNumbers = [2, 1, 4, 9]

mineAndMyBrothersFavoriteNumbers = myFavoriteNumbers ++ myBrothersFavoriteNumbers

howSmartIAm = "Pretty smart"

howSmartMyBrotherIs = "Not as smart as me"

howSmartMeAndMyBrotherAre = howSmartIAm ++ " " ++ howSmartMyBrotherIs

mineAndMyBrothersFavoriteNumbersWithFiveAtTheBeginning = 5:mineAndMyBrothersFavoriteNumbers

-- TODO: figure out how to explicitly type favoriteNumbers as a list of numbers
someOnesSecondFavoriteNumber favoriteNumbers = favoriteNumbers !! 1