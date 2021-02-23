type t = Zero
       | One
       | Plus of { left : t
                 ; right : t
                 }

(* format : t -> string *)
let rec format t =
  match t with
  | Zero -> "0"
  | One -> "1"
  | Plus {left; right} ->
    Lib.fmt "+(%s, %s)" (format left) (format right)
