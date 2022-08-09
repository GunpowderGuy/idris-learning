module Main

import Core.Context
import Compiler.Common
import Idris.Driver
import Idris.Syntax

import Core.CompileExpr -- Needed to use namedDefs

import Data.String

mostrar: NamedDef -> String
mostrar (MkNmFun x y) = "funcion"
mostrar _ = "null"

mlFunction : Name -> List Name -> NamedCExp -> String 
mlFunction nombre argumentos cuerpo = 
  let argumentos2 := map show argumentos
      cuerpo2 := "return soul"
    in
    "fun "++ (show nombre) ++"("++ (joinBy "," argumentos2)++") \n" ++ cuerpo2 ++ "\nend"

gen : List (Name, FC, NamedDef) -> String
--gen lista = Data.String.unlines $ map (\(x,y,z) => show x ++ " endNAME " ++ show z) lista
gen lista = Data.String.unlines $ map (\(x,y,z) => aplicar x z) lista
  where
  aplicar : Name -> NamedDef -> String
  aplicar nombre (MkNmFun listaNombres definicion) = mlFunction nombre listaNombres definicion
  aplicar nombre _ = ""

compile :
  Ref Ctxt Defs -> Ref Syn SyntaxInfo ->
  (tmpDir : String) -> (execDir : String) ->
  ClosedTerm -> (outfile : String) -> Core (Maybe String)
compile syn defs tmp dir term file
  = do coreLift $ putStrLn "I'd rather not. XD"
       cd <- getCompileData False Lifted term
       --let defs = Compiler.Common.CompileData.namedDefs cd
       let defs = cd.namedDefs
       coreLift $ putStrLn (gen defs)
       pure Nothing

execute :
  Ref Ctxt Defs -> Ref Syn SyntaxInfo ->
  (execDir : String) -> ClosedTerm -> Core ()
execute defs syn dir term = do coreLift $ putStrLn "Maybe in an hour."

lazyCodegen : Codegen
lazyCodegen = MkCG compile execute Nothing Nothing

main : IO ()
main = mainWithCodegens [("lazy", lazyCodegen)]
