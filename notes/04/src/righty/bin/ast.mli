(* file: ast.mli
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains the abstract syntax for Mercury.
*)
type t = Literal of int
       | App of { rator : Symbol.t
                ; rands : t list
                }

val i2i : int -> t
val format : t -> string
val equal : t -> t -> bool
