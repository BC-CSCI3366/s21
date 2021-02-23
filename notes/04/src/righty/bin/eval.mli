(* file: eval.mli
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains the API for an evaluator for the mini-PL Mercury.
*)
val eval : Dynamic.t Env.t -> Ast.t -> Dynamic.t
