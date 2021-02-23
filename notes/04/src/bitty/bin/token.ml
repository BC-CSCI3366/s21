type t = LPar | Zero | One | RPar | Plus

(* format : t -> string *)
let format token =
  match token with
  | LPar -> "("
  | RPar -> ")"
  | Zero -> "0"
  | One -> "1"
  | Plus -> "+"
