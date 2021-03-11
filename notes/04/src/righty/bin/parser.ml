(* file: parser.ml
  author: Bob Muller

  CS3366 Programming Languages

   This code implements a recursive descent parser for the mini-PL
   Mercury --- the simplest programming language with just integers.

  Terms:

  E ::= T + E | T - E | T
  T ::= F * T | F / T | F % T | F
  F ::= Integer | ( E )

   Debugging
*)
let dbg = Debug.out "parser"

(* Symbols for built-in operators *)
let plus  = Symbol.fromString "+"
let minus = Symbol.fromString "-"
let times = Symbol.fromString "*"
let div   = Symbol.fromString "/"
let md    = Symbol.fromString "%"

(* Parsing Expressions
*)
let rec expression tokens =        (* E ::= T + E | T - E | T *)
  let (t1Ast, tokens) = term tokens
  in
  match tokens with
  | Token.PLUS :: tokens ->
    let (t2Ast, tokens) = expression tokens
    in
    (Ast.App { rator = plus
             ; rands = [t1Ast; t2Ast]
             }, tokens)
  | Token.MINUS :: tokens ->
    let (t2Ast, tokens) = expression tokens
    in
    (Ast.App { rator = minus
             ; rands = [t1Ast; t2Ast]
             }, tokens)
  | _ -> (t1Ast, tokens)

and
  term tokens =       (* T ::= F * T | F / T | F % T | F *)
  let (t1Ast, tokens) = factor tokens
  in
  match tokens with
  | Token.TIMES :: tokens ->
    let (t2Ast, tokens) = term tokens
    in
    (Ast.App { rator = times
             ; rands = [t1Ast; t2Ast]
             }, tokens)
  | Token.DIV :: tokens ->
    let (t2Ast, tokens) = term tokens
    in
    (Ast.App { rator = div
             ; rands = [t1Ast; t2Ast]
             }, tokens)
  | Token.MOD :: tokens ->
    let (t2Ast, tokens) = term tokens
    in
    (Ast.App { rator = md
             ; rands = [t1Ast; t2Ast]
             }, tokens)
  | _ -> (t1Ast, tokens)
and
  factor tokens =             (* F  ::= Integer | ( E ) *)
  match tokens with
  | (Token.INTEGER i) :: tokens  -> (Ast.i2i i, tokens)     (* Integer *)
  | Token.LPAR :: tokens ->
    let (expr, tokens) = expression tokens
    in
    (match tokens with
     | Token.RPAR :: tokens -> (expr, tokens)               (* ( E ) *)
     | _ -> failwith "( expr followed by neither , nor )")

  | _ -> failwith "factor: parsing factor, found bad input"

let parser tokens =
  dbg (Lib.fmt "tokens = %s" (Token.formatTokens tokens));
  match expression tokens with
  | (ast, []) -> ast
  | _ -> failwith "bad syntax, found a parse but there are leftover tokens."
