(* file: symbol.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains an implementation of symbols.
*)
type t = String.t

let fromString str = str
let format   sym = sym
let compare = String.compare
