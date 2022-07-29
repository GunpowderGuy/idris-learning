module Main

import Core.Context
import Compiler.Common
import Idris.Driver
import Idris.Syntax

import Core.CompileExpr -- Needed to use namedDefs

gen : List (Name, FC, NamedDef) -> String
gen lista = "compiles and runs"

compile :
  Ref Ctxt Defs -> Ref Syn SyntaxInfo ->
  (tmpDir : String) -> (execDir : String) ->
  ClosedTerm -> (outfile : String) -> Core (Maybe String)
compile syn defs tmp dir term file
  = do coreLift $ putStrLn "I'd rather not."
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
