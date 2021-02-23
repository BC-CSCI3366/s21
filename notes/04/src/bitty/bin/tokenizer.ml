(* tokenize : string -> Token.t list *)
let tokenize input =
  let rec tokenize chars =
    match chars with
    | [] -> []
    | ' ' :: chars -> tokenize chars
    | '(' :: chars -> Token.LPar :: tokenize chars
    | ')' :: chars -> Token.RPar :: tokenize chars
    | '0' :: chars -> Token.Zero :: tokenize chars
    | '1' :: chars -> Token.One  :: tokenize chars
    | '+' :: chars -> Token.Plus :: tokenize chars
    | _ ->
      let msg = Lib.fmt "tokenize : unrecognized symbol %c." (List.hd chars)
      in
      failwith msg
  in
  tokenize (Lib.explode input)
