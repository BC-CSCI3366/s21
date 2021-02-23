(* file: main.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains the driver for the little language Mercury.

   Compile and run the Mercury REPL:

   > cd src
   > dune exec bin/main.exe

   Compile and run for testing the parser:

   > cd src
   > dune exec bin/main.exe test
*)
let _ =
  if (Array.length Sys.argv = 2 && Sys.argv.(1) = "test") then
    Test.run ()
  else
    Repl.repl Dynamic.env
