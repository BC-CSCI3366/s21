(* parse : Token.t list -> Ast.t *)
let parse tokens =
  let rec expr tokens =
    match tokens with
    | Token.Zero :: tokens -> (Ast.Zero, tokens)
    | Token.One  :: tokens -> (Ast.One, tokens)
    | Token.LPar :: tokens ->
      let (left, tokens) = expr tokens
      in
      (match tokens with
       | Token.Plus :: tokens ->
         let (right, tokens) = expr tokens
         in
         (match tokens with
          | Token.RPar :: tokens ->
            (Ast.Plus{left; right}, tokens)
          | _ -> failwith "parse: missing right paren")
       | _ -> failwith "parse: missing plus symbol")
    | _ -> failwith "parse: ran out of tokens, bad input"
  in
  match expr tokens with
  | (ast, []) -> ast
  | _ -> failwith "Something hanging around after your program"
