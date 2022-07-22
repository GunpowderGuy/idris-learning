module Main

double2 : Num a => a -> a
double2 x = x + x
-- look up dictionary passing style in the idris2 discord

numero2 : Integer -> Integer
numero2 x = double2 x

numero3: Double -> Double
numero3 x = double2 x

numero : Integer -> Integer
numero x = x+x--double2 x

minimo : Integer -> Integer -> Integer
minimo x y = if x > y then y else x



record User where
  constructor MkUser
  name  : String
  age   : Integer

record User2 where
  constructor MkUser2
  name  : String
  age   : Integer
  age2   : Integer


depends : (x : Bool) -> if x then User else User2
depends True = (MkUser "haha" 2)
depends False = (MkUser2 "compilacion" 4 5)

main : IO ()
main =
  let uno := depends True
      dos := depends False
  in
  putStrLn uno.name
 -- putStrLn ( show (numero 3) ++  show (numero2 5) ++ show (numero3 7.1 ) ++ show(  minimo 1 0 ) ) ++ uno.name


 -- https://smlhelp.github.io/book/concepts/patternmatch.html
-- https://github.com/yuex/awesome-cheatsheet/blob/master/sml.md
