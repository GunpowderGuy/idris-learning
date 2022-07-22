module Main

double2 : Num a => a -> a
double2 x = x + x


numero2 : Integer -> Integer
numero2 x = double2 x

numero3: Double -> Double
numero3 x = double2 x

numero : Integer -> Integer
numero x = x+x--double2 x

minimo : Integer -> Integer -> Integer
minimo x y = if x > y then y else x

main : IO ()
main = putStrLn ( show (numero 3) ++  show (numero2 5) ++ show (numero3 7.1 ) ++ show(  minimo 1 0 ))
