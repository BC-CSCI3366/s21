(* file: env.mli
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains the API for environments for the miniPL Mercury
   principles of programming languages.
*)
type key = Symbol.t
type 'a t

val add   : key -> 'a -> 'a t -> 'a t
val find  : key -> 'a t -> 'a
val empty : 'a t

val make : 'a list -> 'a t
val format : ('a -> string) -> 'a t -> string
