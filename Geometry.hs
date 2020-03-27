module Geometry
(
    sphereVolume,
    sphereArea,
    cubeVolume,
    cubeArea,
    cuboidArea,
    cuboidVolume
) where

    data Shape = Cuboid Float Float Float deriving (Show)

    sphereVolume :: Float -> Float
    sphereVolume r = 4 / 3 * pi * r ^ 3

    sphereArea :: Float -> Float
    sphereArea r = 4 * pi * r ^ 2

    cubeVolume :: Float -> Float
    cubeVolume a = a ^ 3

    cubeArea :: Float -> Float
    cubeArea a = 6 * a ^ 2

    cuboidVolume :: Float -> Float -> Float -> Float
    cuboidVolume l w h = l * w * h

    cuboidArea :: Shape -> Float
    cuboidArea (Cuboid l w h) = l * w * 2 + l * h * 2 + w * h * 2