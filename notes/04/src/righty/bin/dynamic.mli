(* file: dynamic.mli
   author: Bob Muller

   CSCI 3366 Programming Languages

  This file contains code relating to dynamic alues.  NB: the purpose of
  the BinOp constructor is to enable us to carry the implementations of
  primitive operators in the value environment.
*)
type t = Literal of int
       | BinOp of (t -> (t -> t))

val env : t Env.t
val format : t -> string
