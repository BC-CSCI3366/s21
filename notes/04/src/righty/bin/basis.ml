(* file: basis.ml
   author: Bob Muller

   CS3366 Programming Languages

   This file contains support code for building an environment.

   These are the names of the built-ins. NB: The left-to-right
   order matters! When symbols are added or deletedd from the
   following list, corresponding changes are required in the
   Dynamic module.
*)
let operatorNames =
  List.map Symbol.fromString ["+"; "-"; "*"; "/"; "%"]
