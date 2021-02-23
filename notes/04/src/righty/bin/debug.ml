(* file: debug.ml
   author: Bob Muller

   CS3366 Programming Languages
*)
let on = ref false

let out id msg =
  match !on with
  | true  -> print_string (id ^ ": " ^ msg ^ "\n")
  | false -> ()
