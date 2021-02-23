(* file: parser.mli
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains the API for Mercury's parser.
*)
val parser : Token.t list -> Ast.t 
