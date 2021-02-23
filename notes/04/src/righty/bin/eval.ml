(* file: eval.ml
   author: Bob Muller

   CS3366 Programming Languages

   This file contains an evaluator for the mini-PL Mercury.

   Debugging

   let dbg = Debug.out "eval"
*)

(* eval : Dynamic.t Env.t -> Ast.t -> Dynamic.t
*)
let rec eval env ast =
  match ast with
  | Ast.Literal bits -> Dynamic.Literal bits
  | Ast.App {rator; rands} ->
    let rands' = List.map (eval env) rands in
    let f = Env.find rator env
    in
    (match (f, rands') with
     | (Dynamic.BinOp op, [opnd1; opnd2]) -> op opnd1 opnd2
     | _ -> failwith "Mercury eval: bad operation application")
