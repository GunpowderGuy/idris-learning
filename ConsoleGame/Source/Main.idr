module Main

--import Data.String
import Console
import State
import System

%default total

covering
loop : State -> IO()
loop estado = 
  do 
    --putStrLn (show bola.x ++ show bola.y)
    putStrLn (PrintXY (coordinates estado) 'k')
    usleep (cast (1000.0/60.0)) -- sleep for x ( positive ) microseconds
    putStrLn eraseScreen
    loop  (update estado)


covering
main : IO ()
main = 
  let y = 1
      x := 2
  in 
    loop (initi)
      
  
