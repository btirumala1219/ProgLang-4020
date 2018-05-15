multiples maxNumber = [ maxNumber | maxNumber <- [1..maxNumber], maxNumber `mod` 7 == 0, maxNumber `mod` 5 == 0]

doubleAll maxNumber = [ maxNumber*2 | maxNumber <- [1..maxNumber]]

squareEvens maxNumber = [ maxNumber*maxNumber | maxNumber <- [1..maxNumber], maxNumber `mod` 2 == 0]
