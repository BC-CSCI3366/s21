(* file: repl.ml
   author: Bob Muller

   CS3366 Programming Languages

   This file contains a REPL for the mini-language Mercury.

   Debugging

let dbg = Debug.out "eval"
*)
let prompt = Tokenizer.Repl "\nRighty> "

let rec repl env : unit =
  let tokens = Tokenizer.tokenizer prompt
  in
  match tokens with
  | Token.QUIT :: [] -> ()
  | _ ->
    let ast = Parser.parser tokens in
    let astString = Ast.format ast in
    let value = Eval.eval env ast in
    let valueString = Dynamic.format value
    in
    Lib.pfmt "ast = %s\nvalue = %s\n" astString valueString
    ; repl env
