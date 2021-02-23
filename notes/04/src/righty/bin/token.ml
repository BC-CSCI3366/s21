(* file: token.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains the tokens for various different min-languages
   used in CSCI 336.
*)

type t =
  | UNIT | PLUS | MINUS | TIMES | DIV
  | RPLUS | RMINUS | RTIMES | RDIV | MOD | POW
  | LPAR | RPAR | LBRACE | RBRACE | LET | IN
  | INL  | INR | FIRST | SECOND
  | EQ | NE | GT | GE | LT | LE | DOT | COMMA | SEMI
  | COLON | IF | THEN | ELSE | CASE | OF | TRUE | FALSE
  | INTEGER of int | FLOATING of float | ID of Symbol.t
  | INT_TYPE | BOOL_TYPE | REAL_TYPE | UNIT_TYPE | ARROW
  | DARROW | BAR | QUIT

let format token =
  match token with
  | UNIT -> "()" | PLUS -> "+" | MINUS -> "-" | TIMES -> "*" | DIV -> "/"
  | RPLUS -> "+." | RMINUS -> "-." | RTIMES -> "*." | RDIV -> "/."
  | MOD -> "%" | POW -> "^" | LPAR -> "(" | RPAR -> ")" | LBRACE -> "{}"
  | RBRACE -> "}" | LET -> "let" | IN -> "in" | INL -> "inl" | INR -> "inr"
  | FIRST -> "first" | SECOND -> "second" | EQ -> "=" | NE -> "<>"
  | GT -> ">" | GE -> ">=" | LT -> "<" | LE -> "<=" | DOT -> "."
  | COMMA -> "," | SEMI -> ";" | COLON -> ":" | IF -> "if" | THEN -> "then"
  | ELSE -> "else" | CASE -> "case" | OF -> "of" | TRUE -> "true"
  | FALSE -> "false" | (INTEGER i) -> (string_of_int i)
  | (FLOATING f) -> (string_of_float f) | (ID x) -> (Symbol.format x)
  | INT_TYPE -> "int" | BOOL_TYPE -> "bool" | REAL_TYPE -> "real"
  | UNIT_TYPE -> "unit" | ARROW -> "->" | DARROW -> "=>"| BAR -> "|"
  | QUIT -> "q"

let formatTokens tokens =
  let tokenStrings = List.map format tokens in
  let folder s1 s2 = s1 ^ "; " ^ s2
  in
  "[" ^ (List.fold_right folder tokenStrings "]")
