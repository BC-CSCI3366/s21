(* file: repl.mli
   author: Bob Muller

   CS3366 Programming Languages

   This file contains a REPL for the mini-language Mercury.
*)
val repl : (Dynamic.t Env.t) -> unit
