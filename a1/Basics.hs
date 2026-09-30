module Basics where

{-------------------- Basic FP --------------------}
power5 :: Int -> Int
power5 n = n^5

ageDiscount :: Int -> Float -> Float
ageDiscount age basePrice = if age < 18 || age >= 60 then basePrice * 0.8 else basePrice

squareTheDiff :: Int -> Int -> Int
squareTheDiff x y = 
		let diff = x - y
		in diff^2
