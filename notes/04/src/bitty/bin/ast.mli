type t = Zero
       | One
       | Plus of { left : t
                 ; right : t
                 }

(* format : t -> string *)
val format : t -> string
