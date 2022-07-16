-- https://idris-lang.github.io/Idris2/contrib/docs/Control.ANSI.CSI.html
import Data.String
import Control.ANSI.CSI

%default total

export
dummy : String -> String
dummy x = x

-- echo "\e[32A%s\n"             
--  echo '\n' '\n' '\n' '\n' '\n' '\n'      

Newlines : Nat -> String
-- Newlines x = "'\n' '\n' \n \n \n \n "
Newlines x = replicate x '\033'

BactrackLines : Nat -> String
BactrackLines x  = "\033 \033[A \033[A \033[A \033[A \033[A \033[A \033[A" 
--ESC[{line};{column}H ESC[{line};{column}f

--PrintXY : Nat -> Nat -> Char -> String
--PrintXY x y caracter = (cursorMove y x) ++ (singleton caracter)
PrintXY : Cast ty Nat => (ty, ty) -> Char -> String
PrintXY (x, y) caracter = (cursorMove (cast y) (cast x)) ++ (singleton caracter)

eraseScreen : String
eraseScreen = eraseScreen All