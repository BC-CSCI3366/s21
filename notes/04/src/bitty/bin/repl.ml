(* repl : unit -> unit *)
let rec repl () =
  let () = Lib.pfmt "bl> " in
  let input = read_line () in
  let tokens = Tokenizer.tokenize input in
  let ast = Parser.parse tokens in

  let () = Lib.pfmt "input is %s\n" (Ast.format ast)
  in
  repl ()

let () = repl ()
