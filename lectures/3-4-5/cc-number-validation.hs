toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits n = toDigits (n `div` 10) ++ [n `mod` 10]

toDigitsRev n = reverse (toDigits n)

doubleSecond [] = []
doubleSecond [x] = [x]
doubleSecond (x:y:xs) = x : 2 * y : doubleSecond xs 

sumDigits [] = 0
sumDigits (x:xs) = sum (toDigits x) + sumDigits xs

isValid n = (sumDigits (doubleSecond (toDigitsRev n))) `mod` 10 == 0
