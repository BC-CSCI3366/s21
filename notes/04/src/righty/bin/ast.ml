(* file: ast.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains the abstract syntax for the mini-PL Mercury, used in
  CS3366 Principles of Programming Languages.
*)
module L = List

type t = Literal of int
       | App of { rator : Symbol.t
                ; rands : t list
                }

(* The following function is used in the parser to convert OCaml
   literals to Mercury literals.
*)
let i2i (i : int) : t = Literal i

(* format : t -> string *)
let rec format ast =
  match ast with
  | Literal bits -> string_of_int bits

  | App {rator; rands} ->
    let ras = Symbol.format rator in
    let randss = List.map format rands in
    let folder s t = Lib.fmt "%s, %s" s t in
    let randStrings = L.fold_left folder (L.hd randss) (L.tl randss)
    in
    Lib.fmt "%s(%s)" ras randStrings

let rec equal ast1 ast2 =
  match (ast1, ast2) with
  | (Literal a, Literal b) -> compare a b = 0
  | (App {rator; rands}, App {rator = rator'; rands = rands'}) ->
    let pairs = L.combine rands rands'
    in
    (Symbol.compare rator rator') = 0 &&
    (L.for_all (fun (rand, rand') -> equal rand rand') pairs)
  | _ -> false
