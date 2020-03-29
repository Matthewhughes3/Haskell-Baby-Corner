import System.Random

threeCoins :: Int -> (Bool, Bool, Bool)
threeCoins seed = 
    let (firstCoin, newGen) = random (mkStdGen seed)
        (secondCoin, newGen') = random newGen
        (thirdCoin, _) = random newGen'
    in (firstCoin, secondCoin, thirdCoin)

flipCoins :: Int -> Int -> [Bool]
flipCoins seed coinCount = take coinCount $ randoms $ mkStdGen seed